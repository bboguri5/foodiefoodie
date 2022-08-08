
-- ���� �߰� �� ���� �ο�
create user teamB IDENTIFIED BY 1234;
GRANT DBA, connect, RESOURCE TO teamB;

-- DROP TABLE
DROP TABLE profile_upload;
DROP TABLE review_upload;
DROP TABLE promotion_upload;
DROP TABLE reply_faq;
DROP TABLE review_faq;
DROP TABLE promotion_faq;
DROP TABLE review_like;
DROP TABLE reply;
DROP TABLE favorite_store;
DROP TABLE hot_deal;
DROP TABLE review_board;
DROP TABLE premiume_promotion_board;
DROP TABLE promotion_food_menu;
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


-- SEQUENCE ����
CREATE SEQUENCE seq_promotion_board;
CREATE SEQUENCE seq_promotion_food_menu;
CREATE SEQUENCE seq_review_board;
CREATE SEQUENCE seq_reply;
CREATE SEQUENCE seq_promotion_faq;
CREATE SEQUENCE seq_review_faq;
CREATE SEQUENCE seq_reply_faq;


-- TABLE ����
-- ����
CREATE TABLE member (
    email VARCHAR2(50) PRIMARY KEY
    , password VARCHAR2(50) NOT NULL
    , nick_name VARCHAR2(30) NOT NULL
    , phone_number VARCHAR2(20) NOT NULL
    , birth NUMBER(8) NOT NULL
    , address VARCHAR2(50) NOT NULL
    , name VARCHAR2(15) NOT NULL
    , gender VARCHAR2(2) NOT NULL
    , auth VARCHAR2(20)
    , regist_date DATE DEFAULT SYSDATE
    , login_time DATE
);
ALTER TABLE member
MODIFY auth VARCHAR2(20) DEFAULT 'COMMON';

-- �ڵ��α���
CREATE TABLE auto_login (
    email VARCHAR2(50) NOT NULL
    , cookie VARCHAR2(50) NOT NULL
    , ip_address VARCHAR2(30) NOT NULL
    , logout_time DATE
    , CONSTRAINT fk_auto_login_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- �����
CREATE TABLE MASTER (
    business_no VARCHAR2(50) PRIMARY KEY
    , email VARCHAR2(50) NOT NULL
    , master_name VARCHAR2(15) NOT NULL
    , store_name VARCHAR2(50) NOT NULL
    , store_address VARCHAR2(50) NOT NULL
    , food_categories VARCHAR2(50) NOT NULL
    , store_reg_date DATE
    , hot_deal VARCHAR2(2) DEFAULT 'N'
    , store_call_number VARCHAR2(20) NOT NULL
    , CONSTRAINT fk_master_email
    FOREIGN KEY (email) REFERENCES member (email) ON DELETE CASCADE    
);

-- ȫ����
CREATE TABLE promotion_board (
    business_no VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) PRIMARY KEY
    , content CLOB
    , last_updated DATE DEFAULT SYSDATE
    , title VARCHAR2(70)
    , CONSTRAINT fk_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

-- ���� �޴�
CREATE TABLE promotion_food_menu(
    menu_no NUMBER(5) PRIMARY KEY
    , promotion_bno NUMBER(10) NOT NULL
    , menu_name VARCHAR2(20) NOT NULL
    , price NUMBER(6) NOT NULL
    , CONSTRAINT fk_menu_busi_no FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- ������ ����
CREATE TABLE premiume_promotion_board (
    promotion_bno NUMBER(10) NOT NULL
    , start_date DATE
    , end_date DATE
    , CONSTRAINT fk_pro_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- ����
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
    , CONSTRAINT fk_review_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- �ֵ�
CREATE TABLE hot_deal (
    business_no VARCHAR2(50) NOT NULL
    , discount_price NUMBER(5) NOT NULL
    , end_date DATE
    , start_date DATE
    , CONSTRAINT fk_hotdeal_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

-- ���ã�� 
CREATE TABLE favorite_store (
    email VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) NOT NULL
    , CONSTRAINT fk_fav_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , CONSTRAINT fk_fav_promo_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- ����ۿ� ���� ���
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

-- ���� ���ƿ�(��õ)
CREATE TABLE review_like (
    review_bno NUMBER(10) NOT NULL
    , email VARCHAR2(50) NOT NULL
    , CONSTRAINT fk_like_rev_bno FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
    , CONSTRAINT fk_like_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- ȫ���� �Ű�
CREATE TABLE promotion_faq (
    pr_faq_no NUMBER(10) PRIMARY KEY
    , promotion_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
);

-- ����� �Ű�
CREATE TABLE review_faq (
    re_faq_no NUMBER(10) PRIMARY KEY
    , review_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
);

-- ��� �Ű�
CREATE TABLE reply_faq (
    reply_faq_no NUMBER(10) PRIMARY KEY
    , reply_no NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
);

-- ȫ���� ���� ���ε�
CREATE TABLE promotion_upload (
    promotion_bno NUMBER(10) NOT NULL
    , file_path VARCHAR2(150) NOT NULL
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_pro_upload FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- ���� ���� ���ε�
CREATE TABLE review_upload(
    review_bno NUMBER(10) NOT NULL
    , file_path VARCHAR2(150) NOT NULL
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_rev_upload FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
);

-- �������̹��� ���� ���ε�
CREATE TABLE profile_upload(
    email VARCHAR2(50) PRIMARY KEY
    , file_path VARCHAR2(150) NOT NULL
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_profile_upload FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- ������ ���� ���̺��� ����~~
-- API�� Ȱ���ؼ� ���̷�Ʈ�� ��ȿ ���������� ������ ���� �� ������� �˷��شٸ�
-- ���� ���̺��� ���� ������ �ʿ䰡 �������.
CREATE TABLE receipt_upload();
