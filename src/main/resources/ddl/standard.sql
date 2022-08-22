
-- 계정 추가 및 권한 부여
create user teamB IDENTIFIED BY 1234;
GRANT DBA, connect, RESOURCE TO teamB;

-- DROP TABLE
DROP TABLE black_list;
DROP TABLE black_list_master;
DROP TABLE report_member;
DROP TABLE report_master;
DROP TABLE promotion_upload_title_img;
DROP TABLE promotion_upload_detail_img;
DROP TABLE promotion_food_menu;
DROP TABLE promotion_store_time;
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
DROP TABLE promotion_board;
DROP TABLE MASTER;
DROP TABLE auto_login;
DROP TABLE member;


-- DROP SEQUENCE
DROP SEQUENCE seq_promotion_board;
DROP SEQUENCE seq_promotion_food_menu;
DROP SEQUENCE seq_review_board;
DROP SEQUENCE seq_reply;
DROP SEQUENCE seq_promotion_faq;
DROP SEQUENCE seq_review_faq;
DROP SEQUENCE seq_reply_faq;


-- SEQUENCE 생성
CREATE SEQUENCE seq_promotion_board;
CREATE SEQUENCE seq_promotion_food_menu;
CREATE SEQUENCE seq_review_board;
CREATE SEQUENCE seq_reply;
CREATE SEQUENCE seq_promotion_faq;
CREATE SEQUENCE seq_review_faq;
CREATE SEQUENCE seq_reply_faq;


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
    , STORE_REG_DATE number(10)
    , hot_deal VARCHAR2(2) DEFAULT 'N'
    , store_call_number VARCHAR2(20) NOT NULL
    , store_detail_address VARCHAR2(50) NULL
    , store_extra_address VARCHAR2(50) NULL
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
    , file_name VARCHAR2(100) NULL
    , file_path CLOB NOT NULL
    , CONSTRAINT fk_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);


-- 음식 메뉴 및 업로드
    CREATE TABLE promotion_food_menu(
        menu_no NUMBER(5)primary key
        , promotion_bno NUMBER(10) NOT NULL
        , menu_name VARCHAR2(20) NOT NULL
        , price NUMBER(6) NOT NULL
        , file_path clob
        , file_name VARCHAR2(100)
        , CONSTRAINT fk_menu_busi_no FOREIGN KEY (promotion_bno)
        REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
    );


-- 월정액 가게
CREATE TABLE premiume_promotion_board (
    promotion_bno NUMBER(10) NOT NULL
    , start_date NUMBER(10)
    , end_date NUMBER(10)
    , CONSTRAINT fk_pro_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);


-- 리뷰
CREATE TABLE review_board (
    email VARCHAR2(50) NOT NULL
    , title VARCHAR2(70) NOT NULL
    , content CLOB
    , review_bno NUMBER(10) PRIMARY KEY
    , business_no VARCHAR2(50) NOT NULL
    , last_updated DATE DEFAULT SYSDATE
    , like_cnt NUMBER(8) DEFAULT 0
    , star_rate NUMBER(1) NOT NULL
    , private VARCHAR2(2) DEFAULT 'F'
    , report_cnt number(2) default 0
    , CONSTRAINT fk_review_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);


-- 핫딜
CREATE TABLE hot_deal (
    business_no VARCHAR2(50) NOT NULL
    , discount_price NUMBER(5) NOT NULL
    , start_date NUMBER(10)
    , end_date NUMBER(10)
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
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , reply_writer_email VARCHAR2(50) NOT NULL
);


-- 리뷰 파일 업로드
CREATE TABLE review_upload(
    review_bno NUMBER(10) NOT NULL
    , file_path VARCHAR2(150) NOT NULL
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_rev_upload FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
);

-- 프로필이미지 파일 업로드
CREATE TABLE profile_upload(
    email VARCHAR2(50) PRIMARY KEY
    , file_path VARCHAR2(150) NOT NULL
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


COMMIT;


-- 영수증 관련 테이블은 아직~~
-- API를 활용해서 다이렉트로 유효 영수증인지 검증이 끝난 후 결과만을 알려준다면
-- 굳이 테이블을 만들어서 관리할 필요가 없어보여요.
CREATE TABLE receipt_upload();


-- 추가



-----------------------------------

