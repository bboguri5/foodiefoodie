-- 계정 추가 및 권한 부여
create user teamB IDENTIFIED BY 1234;
GRANT DBA, connect, RESOURCE TO teamB;

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
DROP TABLE profile_upload;
DROP TABLE review_upload;
DROP TABLE reply_faq;
DROP TABLE review_faq;
DROP TABLE promotion_faq;
DROP TABLE review_like;
DROP TABLE reply;
DROP TABLE favorite_store;
DROP TABLE hot_deal;
DROP TABLE review_board;
DROP TABLE premiume_promotion_board;
DROP TABLE promotion_store_time;
DROP TABLE promotion_board;
DROP TABLE MASTER;
DROP TABLE auto_login;
DROP TABLE member;

commit;

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
    , login_time DATE
    , detail_address VARCHAR2(50)
    , extra_address VARCHAR2(50)
);


-- 자동로그인
CREATE TABLE auto_login (
    email VARCHAR2(50) NOT NULL
    , session_id VARCHAR2(50) NOT NULL
    , ip_address VARCHAR2(30)
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
    , store_reg_date number(10)
    , hot_deal VARCHAR2(2) DEFAULT 'OFF'
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

-- 월정액 가게
CREATE TABLE premiume_promotion_board (
    promotion_bno NUMBER(10) NOT NULL
    , start_date NUMBER(10)
    , end_date NUMBER(10)
    , complete VARCHAR2(2) DEFAULT 'N'  -- f 신청중 t 진행중 n종료 또는 취소
    , CONSTRAINT fk_pro_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
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

-- 프로필이미지 파일 업로드
CREATE TABLE profile_upload(
    email VARCHAR2(50) PRIMARY KEY
    , file_path clob not null
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_profile_upload FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
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
    , CONSTRAINT fk_pro_upload_detail_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- 홍보글 메인이미지
create table promotion_upload_title_img(
   promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
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
        , menu_name VARCHAR2(20) NOT NULL
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


------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO master
SELECT * FROM Master;
ALTER TABLE master MODIFY hot_deal VARCHAR2(3) DEFAULT 'OFF' ;
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1111', 'email1@naver.com', '서해원', '세상에서 제일 맛있는 집', '서울 금천구 가산동', 'ON', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1112', 'email1@naver.com', '서해원', '은평구 식당', '서울 은평구 진관동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1113', 'email1@naver.com', '서해원', '해원 레스토랑', '서울 금천구 가산동', 'ON', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1114', 'email1@naver.com', '서해원', '잘 끓인 라면', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1115', 'email1@naver.com', '서해원', '아이스 냉면', '대구 동구', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1116', 'email1@naver.com', '서해원', '삼계탕 냠냠', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1117', 'email2@naver.com', '해해해', '해해해 족발', '서울 금천구 가산동', 'ON', '010-5555-6666');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1118', 'email2@naver.com', '해해해', '디저트 맛집', '서울 금천구 가산동', '010-5555-6666');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1119', 'email2@naver.com', '해해해', '너무 맛나 김밥', '서울 금천구 가산동', 'ON', '010-5555-6666');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1120', 'email2@naver.com', '해해해', '너무 좋아 떡볶이', '서울 금천구 가산동', '010-5555-6666');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1121', 'email2@naver.com', '해해해', '카페 해해해', '서울 금천구 가산동', 'ON', '010-5555-6666');
COMMIT;

-- INSERT INTO hot_deal
SELECT * FROM master WHERE hot_deal='ON';
SELECT * FROM hot_deal;
INSERT INTO hot_deal (business_no, discount_price) VALUES ('1234-2222-3333-1111', 10);
INSERT INTO hot_deal (business_no, discount_price) VALUES ('1234-2222-3333-1113', 5);
INSERT INTO hot_deal (business_no, discount_price) VALUES ('1234-2222-3333-1117', 14);
INSERT INTO hot_deal (business_no, discount_price) VALUES ('1234-2222-3333-1119', 21);
INSERT INTO hot_deal (business_no, discount_price) VALUES ('1234-2222-3333-1121', 7);
COMMIT;

-- promotion

SELECT * FROM promotion_board;
INSERT INTO promotion_board (business_no, promotion_bno, content, title, hashTag) VALUES ('1234-2222-3333-1111', seq_promotion_board.nextval, 'some content', 'title', '한식 맛집 금천구');

SELECT * FROM premiume_promotion_board;
INSERT INTO premiume_promotion_board (promotion_bno, complete) VALUES (22, 't');

commit;

-- review
INSERT INTO review_board (review_bno, email, title, content, business_no, star_rate, store_name, store_address) VALUES (seq_review_board.nextval, 'email3@naver.com', '맛집 후기', '내용 길어요!!!!!!!!!!!!!!!!!!!!!
호호호호호 너무 맛있었다구요 ㅁ러내ㅑ러대ㅑ러ㅐ쟏러ㅐ러냐ㅐ러대ㅑㄴ ㅓㅐ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 다시 갈거에요~~~~~~~~~~~~~~~~~~~~~~~~~! 금천구 맛집입니당.', '1234-2222-3333-1111', 5, '세상에서 제일 맛있는 집', '서울 금천구 가산동');

UPDATE promotion_board SET avg_star_rate = 5;
UPDATE promotion_board SET review_cnt = 1;

commit;

