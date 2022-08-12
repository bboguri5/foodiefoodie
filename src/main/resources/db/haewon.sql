
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
DROP TABLE black_list;
DROP TABLE black_list_master;
DROP TABLE promotion_food_menu;
DROP TABLE promotion_food_menu_upload;
DROP TABLE promotion_upload_detail_img;
DROP TABLE promotion_upload_title_img;
DROP TABLE report_master;
DROP TABLE report_member;




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
-- ���� -- ����԰� �ٸ� ���̺�
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
MODIFY password VARCHAR2(150);

commit;

select * from member;

insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('abc1234@naver.com', 'aaaa', 'Julie', '01012341234', '20000101', '서울 금천구', '서해원', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('bbbb2222@naver.com', '1234', 'Haewon', '01022225555', '20001212', '서울 강남구', '해원서', 'F');

SELECT * FROM master;
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1111', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1112', 'abc1234@naver.com', '서해원', '맛나다 냉면', '서울 금천구 가산동', '010-3222-2333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1113', 'abc1234@naver.com', '서해원', '오우 커피 맛나', '서울 강남구 도곡동', '010-2333-3553');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1114', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠2', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1115', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠3', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1116', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠3', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1117', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠4', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1118', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠5', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1119', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠6', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1120', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠7', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1121', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠8', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1122', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠9', '서울 금천구 가산동', 'Y', '010-2222-3333');

SELECT * FROM hot_deal;

INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1234-2222-3333-1111', 8000, 20220809, 20220707);

SELECT * FROM promotion_board;
DELETE FROM promotion_board;

ALTER TABLE promotion_board
ADD file_name VARCHAR2(100) NULL;

ALTER TABLE promotion_board
ADD file_path CLOB NOT NULL;


INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1111', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1112', seq_promotion_board.nextval, '양식 파스타 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1113', seq_promotion_board.nextval, '일식 스시 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1114', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/owner.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1115', seq_promotion_board.nextval, '중식 짜장면 짬뽕 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/owner.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1116', seq_promotion_board.nextval, '카페 커피 케이크 빵 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/owner.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1117', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/food_review.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1118', seq_promotion_board.nextval, '술집 소주 맥주 안주 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/food_review.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1119', seq_promotion_board.nextval, '일식 라멘 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/food_review.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1120', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/food_review.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1121', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');
SELECT * FROM premiume_promotion_board;
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1122', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');

INSERT INTO premiume_promotion_board
VALUES(1, 20220101, 20220808);
INSERT INTO premiume_promotion_board
VALUES(2, 20220101, 20220809);
INSERT INTO premiume_promotion_board
VALUES(3, 20220101, 20220820);
INSERT INTO premiume_promotion_board
VALUES(4, 20220101, 20220822);
INSERT INTO premiume_promotion_board
VALUES(5, 20220101, 20220807);
INSERT INTO premiume_promotion_board
VALUES(6, 20220101, 20220731);
INSERT INTO premiume_promotion_board
VALUES(7, 20220101, 20220808);
INSERT INTO premiume_promotion_board
VALUES(8, 20220101, 20220808);

SELECT * FROM review_board;
DELETE FROM review_board;

-- ReviewBoardMapperTest 에서 INSERT
INSERT INTO review_board (email, title, content, review_bno, business_no, star_rate)
VALUES ('bbbb2222@naver.com', '제목입니다~', '내용입니다~', seq_review_board.nextval, '1234-2222-3333-1111', 5);

COMMIT;


        SELECT COUNT(*)
        FROM master M JOIN promotion_board P
        ON M.business_no = P.business_no
        WHERE store_address LIKE '%금천구%';


update member set auth = 'MASTER' WHERE email = 'abc1234@naver.com';

SELECT * FROM MEMBER ;

SELECT * FROM MEMBER
WHERE email = 'soslimso@naver.com'
;


DELETE FROM member
where email = 'soslimso@naver.com'
;


DELETE FROM member
where email = 'bbbb2222@naver.com'
;




ALTER TABLE member
MODIFY address VARCHAR2(150);
ALTER TABLE member
MODIFY auth VARCHAR2(20) DEFAULT 'COMMON';

update member set auth = 'MASTER' WHERE email = 'abc1234@naver.com';
-- �ڵ��α���
CREATE TABLE auto_login (
    email VARCHAR2(50) NOT NULL
    , cookie VARCHAR2(50) NOT NULL
    , ip_address VARCHAR2(30) NOT NULL
    , logout_time DATE
    , CONSTRAINT fk_auto_login_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

ALTER TABLE auto_login
RENAME COLUMN cookie TO session_id;

ALTER TABLE auto_login
MODIFY ip_address VARCHAR2(30) NULL;

-- �����-- ����ڿ� �Ϲ� ����� ���̺� ����
CREATE TABLE MASTER (
    business_no VARCHAR2(50) PRIMARY KEY
    , email VARCHAR2(50) NOT NULL
    , master_name VARCHAR2(15) NOT NULL
    , store_name VARCHAR2(50) NOT NULL
    , store_address VARCHAR2(50) NOT NULL
    , store_reg_date DATE
    , hot_deal VARCHAR2(2) DEFAULT 'N'
    , store_call_number VARCHAR2(20) NOT NULL
    , CONSTRAINT fk_master_email
    FOREIGN KEY (email) REFERENCES member (email) ON DELETE CASCADE
);
alter table master modify STORE_REG_DATE number(10);


-- ȫ����
CREATE TABLE promotion_board (
    business_no VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) PRIMARY KEY
    , hashTag varchar2(200) not null
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

-- ���� �޴� ���� ���ε�
CREATE TABLE promotion_food_menu_upload(
         promotion_bno NUMBER(10) NOT NULL
        ,menu_no NUMBER(10) NOT NULL
        , file_path clob
        , file_name VARCHAR2(100) NOT NULL
        , CONSTRAINT fk_pro_food_menu_upload FOREIGN KEY (menu_no)
    REFERENCES promotion_food_menu (menu_no) ON DELETE CASCADE
);

-- ������ ����
CREATE TABLE premiume_promotion_board (
    promotion_bno NUMBER(10) NOT NULL
    , start_date DATE
    , end_date DATE
    , CONSTRAINT fk_pro_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);
alter table premiume_promotion_board
MODIFY start_date NUMBER(10);

alter table premiume_promotion_board
MODIFY end_date NUMBER(10);





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

alter table hot_deal
MODIFY start_date NUMBER(10);

alter table hot_deal
MODIFY end_date NUMBER(10);

-- ���ã��
CREATE TABLE favorite_store (
    email VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) NOT NULL -- ȫ����
    , CONSTRAINT fk_fav_email FOREIGN KEY (email) -- ����
    REFERENCES member (email) ON DELETE CASCADE --
    , CONSTRAINT fk_fav_promo_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

select * from favorite_store;

insert into


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

---- ȫ���� ���� ���ε�
--CREATE TABLE promotion_upload (
--    promotion_bno NUMBER(10) NOT NULL
--    , file_path CLOB NOT NULL
--    , file_name VARCHAR2(100)
--    , CONSTRAINT fk_pro_upload FOREIGN KEY (promotion_bno)
--    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
--);
--
--DROP TABLE promotion_upload;

ȫ���� �̹��� ��з��ؼ� �ִ°� �����Ű��ƿ� ���ο��� Ÿ��Ʋ ���� ǥ���� �� ����� �� �ֵ��� !
�׷��� �׳� ���̺� 3������ ������� ! �޴��̹������̺��� ������ �ִ��� �̸��� ���� !

create table promotion_upload_detail_img(
      promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
    , CONSTRAINT fk_pro_upload_detail_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

create table promotion_upload_title_img(
   promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
    , CONSTRAINT fk_pro_upload_title_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);
alter table promotion_food_menu_upload rename to promotion_upload_menu_img;


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


commit ;

CREATE TABLE report_member (
    email VARCHAR2(50) NOT NULL
    , report_cnt NUMBER (2) DEFAULT 1
    , CONSTRAINT fk_report_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

CREATE TABLE black_list (
    email VARCHAR2(50) NOT NULL
);


ALTER TABLE promotion_faq
ADD promotion_writer_email VARCHAR2(50) NOT NULL;

ALTER TABLE review_faq
ADD review_writer_email VARCHAR2(50) NOT NULL;

ALTER TABLE reply_faq
ADD reply_writer_email VARCHAR2(50) NOT NULL;

ALTER TABLE member
ADD detail_address VARCHAR2(50) NULL;

ALTER TABLE member
ADD extra_address VARCHAR2(50) NULL;

ALTER TABLE master
ADD store_detail_address VARCHAR2(50) NULL;

ALTER TABLE master
ADD store_extra_address VARCHAR2(50) NULL;

COMMIT;

create table report_master (
    business_no VARCHAR2(50) NOT NULL
    , report_cnt NUMBER (2) DEFAULT 1
    , CONSTRAINT fk_report_business_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

CREATE TABLE black_list_master (
    business_no VARCHAR2(50) NOT NULL
);

alter table promotion_faq
add business_no varchar2(50) not null;

ALTER TABLE promotion_board
ADD avg_star_rate DECIMAL(3, 2) DEFAULT 0;

ALTER TABLE promotion_board
ADD review_cnt NUMBER(10) DEFAULT 0;

alter table review_board
add report_cnt number(2) default 0;

alter table promotion_board add hashTag varchar2(200) not null;

commit;