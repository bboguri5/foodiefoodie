-- 계정 추가 및 권한 부여
--create user teamB IDENTIFIED BY 1234;
--GRANT DBA, connect, RESOURCE TO teamB;

-- DROP TABLE
drop table order_detail;
drop table order_list;
drop table PROMOTION_UPLOAD_MENU_IMG;
drop table promotion_notice;
DROP TABLE black_list;
DROP TABLE black_list_master;
DROP TABLE report_member;
DROP TABLE report_master;
DROP TABLE promotion_upload_title_img;
DROP TABLE promotion_upload_detail_img;
DROP TABLE promotion_food_menu;
DROP TABLE review_upload;
DROP TABLE reply_faq;
DROP TABLE review_faq;
DROP TABLE promotion_faq;
DROP TABLE review_like;
DROP TABLE reply;
DROP TABLE favorite_store;
DROP TABLE hot_deal;
DROP TABLE review_board;
DROP TABLE promotion_store_time;
DROP TABLE promotion_board;
DROP TABLE MASTER;
DROP TABLE auto_login;
DROP TABLE member;

-- DROP SEQUENCE
DROP SEQUENCE SEQ_ORDER_NO;
DROP SEQUENCE SEQ_PROMOTION_BOARD;
DROP SEQUENCE SEQ_PROMOTION_FAQ;
DROP SEQUENCE SEQ_PROMOTION_FOOD_MENU;
DROP SEQUENCE SEQ_PROMOTION_MENU_IMG;
DROP SEQUENCE SEQ_PROMOTION_NOTICE;
DROP SEQUENCE SEQ_REPLY;
DROP SEQUENCE SEQ_REPLY_FAQ;
DROP SEQUENCE SEQ_REVIEW_BOARD;
DROP SEQUENCE SEQ_REVIEW_FAQ;


-- SEQUENCE 생성
CREATE SEQUENCE SEQ_ORDER_NO;
CREATE SEQUENCE SEQ_PROMOTION_BOARD;
CREATE SEQUENCE SEQ_PROMOTION_FAQ;
CREATE SEQUENCE SEQ_PROMOTION_FOOD_MENU;
CREATE SEQUENCE SEQ_PROMOTION_MENU_IMG;
CREATE SEQUENCE SEQ_PROMOTION_NOTICE;
CREATE SEQUENCE SEQ_REPLY;
CREATE SEQUENCE SEQ_REPLY_FAQ;
CREATE SEQUENCE SEQ_REVIEW_BOARD;
CREATE SEQUENCE SEQ_REVIEW_FAQ;

-- TABLE 생성
-- 유저
CREATE TABLE member (
    email VARCHAR2(50) PRIMARY KEY
    , password VARCHAR2(150) NOT NULL
    , nick_name VARCHAR2(30) NOT NULL
    , phone_number VARCHAR2(20) NOT NULL
    , birth NUMBER(8) NOT NULL
    , address VARCHAR2(150) NOT NULL
    , name VARCHAR2(15) NOT NULL
    , gender VARCHAR2(2) NOT NULL
    , auth VARCHAR2(20) DEFAULT 'COMMON'
    , regist_date DATE DEFAULT SYSDATE
    , detail_address VARCHAR2(50)
    , extra_address VARCHAR2(50)
);

-- 자동로그인
CREATE TABLE auto_login (
    email VARCHAR2(50) NOT NULL
    , session_id VARCHAR2(50) NOT NULL
    , logout_time DATE
    , CONSTRAINT fk_auto_login_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);
-- 사업자
CREATE TABLE MASTER (
    business_no VARCHAR2(50) PRIMARY KEY
    , email VARCHAR2(50) NOT NULL
    , master_name VARCHAR2(15) NOT NULL
    , store_name VARCHAR2(50) NOT NULL
    , store_address VARCHAR2(150) NOT NULL
    , hot_deal VARCHAR2(3) DEFAULT 'OFF'
    , store_call_number VARCHAR2(20) NOT NULL
    , store_detail_address VARCHAR2(50) NULL
    , store_extra_address VARCHAR2(50) NULL
    , promotion_auth varchar2(20) default 'COMMON'
    , CONSTRAINT fk_master_email
    FOREIGN KEY (email) REFERENCES member (email) ON DELETE CASCADE
);

-- 홍보글
CREATE TABLE promotion_board (
    business_no VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) PRIMARY KEY
    , content CLOB
    , last_updated DATE DEFAULT SYSDATE
    , title VARCHAR2(70)
    , avg_star_rate DECIMAL(3, 2) DEFAULT 0
    , review_cnt NUMBER(10) DEFAULT 0
    , hashTag varchar2(200) not null
    , report_cnt number(2) default 0
    , CONSTRAINT fk_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);


-- 리뷰
CREATE TABLE review_board (
    email VARCHAR2(50) NOT NULL
    , title VARCHAR2(70) NOT NULL
    , content CLOB
    , review_bno NUMBER(10) PRIMARY KEY
    , business_no VARCHAR2(50) NULL
    , last_updated DATE DEFAULT SYSDATE
    , like_cnt NUMBER(8) DEFAULT 0
    , star_rate NUMBER(2) DEFAULT 5
    , private VARCHAR2(2) DEFAULT 'F'
    , report_cnt number(2) default 0
    , store_name VARCHAR2(50) NOT NULL
    , store_address VARCHAR2(150) NOT NULL
    , store_detail_address VARCHAR2(50) NULL
    , store_extra_address VARCHAR2(50) NULL
    , CONSTRAINT fk_review_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 핫딜
CREATE TABLE hot_deal (
    business_no VARCHAR2(50) NOT NULL
    , discount_price NUMBER(5) NOT NULL
    , CONSTRAINT fk_hotdeal_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);


-- 즐겨찾기
CREATE TABLE favorite_store (
    email VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) NOT NULL
    , CONSTRAINT fk_fav_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , CONSTRAINT fk_fav_promo_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- 리뷰글에 대한 댓글
CREATE TABLE reply (
    review_bno NUMBER(10) NOT NULL
    , reply_no NUMBER(10) PRIMARY KEY
    , email VARCHAR2(50) NOT NULL
    , content CLOB
    , nick_name VARCHAR2(30) NOT NULL
    , last_updated DATE DEFAULT SYSDATE
    , CONSTRAINT fk_rep_rev_bno FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
    , CONSTRAINT fk_rep_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 리뷰 좋아요(추천)
CREATE TABLE review_like (
    review_bno NUMBER(10) NOT NULL
    , email VARCHAR2(50) NOT NULL
    , CONSTRAINT fk_like_rev_bno FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
    , CONSTRAINT fk_like_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 홍보글 신고
CREATE TABLE promotion_faq (
    pr_faq_no NUMBER(10) PRIMARY KEY
    , promotion_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , promotion_writer_email VARCHAR2(50) NOT NULL
    , business_no varchar2(50) not null
);


-- 리뷰글 신고
CREATE TABLE review_faq (
    re_faq_no NUMBER(10) PRIMARY KEY
    , review_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , review_writer_email VARCHAR2(50) NOT NULL
);


-- 댓글 신고
CREATE TABLE reply_faq (
    reply_faq_no NUMBER(10) PRIMARY KEY
    , reply_no NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , reply_faq_content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , reply_writer_email VARCHAR2(50) NOT NULL
);


-- 리뷰 파일 업로드
CREATE TABLE review_upload(
    review_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NOT NULL
    , file_size number(20)
    , file_type varchar2(10)
    , file_byte clob
    , file_data clob
    , CONSTRAINT fk_rev_upload FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
);


-- 신고처리된 내역있는 일반유저
CREATE TABLE report_member (
    email VARCHAR2(50) NOT NULL
    , report_cnt NUMBER (2) DEFAULT 1
    , CONSTRAINT fk_report_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 블랙리스트 (일반유저)
CREATE TABLE black_list (
    email VARCHAR2(50) NOT NULL
);


-- 신고처리된 내역있는 사업자
create table report_master (
    business_no VARCHAR2(50) NOT NULL
    , report_cnt NUMBER (2) DEFAULT 1
    , CONSTRAINT fk_report_business_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);


-- 블랙리스트 (사업자)
CREATE TABLE black_list_master (
    business_no VARCHAR2(50) NOT NULL
);


-- 홍보글 상세 이미지
create table promotion_upload_detail_img(
      promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
    , file_mediatype varchar2(10)
    , file_size number(20)
    , file_byte clob
    , file_data clob
    , CONSTRAINT fk_pro_upload_detail_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);



-- 홍보글 메인이미지
create table promotion_upload_title_img(
   promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
    , file_mediatype varchar2(10)
    , file_size number(20)
    , file_byte clob
    , file_data clob
    , CONSTRAINT fk_pro_upload_title_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);


-- 영업시간
 create table PROMOTION_STORE_TIME
    (
        promotion_bno number(10) NOT NULL
        ,weekdayOpenTime varchar2(10) NOT NULL
        ,weekdayCloseTime varchar2(10) NOT NULL
        ,weekendOpenTime varchar2(10) NOT NULL
        ,weekendCloseTime varchar2(10) NOT NULL
        ,breakStartTime varchar2(10) NOT NULL
        ,breakEndTime varchar2(10) NOT NULL
        ,closedDay VARCHAR2(20)
        , CONSTRAINT fk_store_time_promotion_bno FOREIGN KEY (promotion_bno)
        REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
    );

-- 음식 메뉴
CREATE TABLE promotion_food_menu(
        menu_no NUMBER(5) primary key
        , promotion_bno NUMBER(10) NOT NULL
        , menu_name VARCHAR2(100) NOT NULL
        , price NUMBER(6) NOT NULL
        , CONSTRAINT fk_menu_busi_no FOREIGN KEY (promotion_bno)
        REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
    );

CREATE TABLE order_list (
    order_no NUMBER(8) PRIMARY KEY -- 주문 번호
    , business_no VARCHAR2(50) NOT NULL -- 주문이 들어간 가게 사업자 번호
    , CONSTRAINT fk_order_busi_no FOREIGN KEY (business_no)
    REFERENCES MASTER (business_no) ON DELETE CASCADE
    , email VARCHAR2(50) NOT NULL -- 주문한 사람 계정 이메일
    , CONSTRAINT fk_order_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , order_date DATE DEFAULT SYSDATE -- 주문 날짜
);

CREATE TABLE order_detail (
    order_no NUMBER(8) NOT NULL -- 주문 번호
    , CONSTRAINT fk_order_no FOREIGN KEY (order_no)
    REFERENCES order_list (order_no) ON DELETE CASCADE
    , order_menu VARCHAR2(50) NOT NULL -- 주문한 메뉴명
    , menu_ea NUMBER(2) NOT NULL -- 주문 수량
    , price NUMBER(10) NOT NULL -- 가격
    , discount NUMBER(3) null
);

create table promotion_notice
(
promotion_bno NUMBER(10),
notice_no NUMBER(10) PRIMARY KEY,
content varchar2(300) NOT NULL,
update_date date DEFAULT SYSDATE NOT NULL,
CONSTRAINT fk_promotion_bno_notice FOREIGN KEY (promotion_bno)
REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);



create table PROMOTION_UPLOAD_MENU_IMG (
        promotion_bno number(10)
        , menu_no number(5)
        ,file_path clob
        ,file_name varchar2(100)
        ,file_mediatype varchar2(20)
        ,file_size number(20)
        ,file_byte clob
        ,file_data clob
        ,CONSTRAINT fk_promotion_bno_menu_img FOREIGN KEY (promotion_bno)
              REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
        ,CONSTRAINT fk_menu_no_menu_img FOREIGN KEY (menu_no)
              REFERENCES PROMOTION_FOOD_MENU (menu_no) ON DELETE CASCADE
);



COMMIT;

-- 영수증 관련 테이블은 아직~~
-- API를 활용해서 다이렉트로 유효 영수증인지 검증이 끝난 후 결과만을 알려준다면
-- 굳이 테이블을 만들어서 관리할 필요가 없어보여요.
--CREATE TABLE receipt_upload();

-- 추가





-----------------------------------
