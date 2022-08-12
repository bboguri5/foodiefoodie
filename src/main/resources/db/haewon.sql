------------------------------ CREATE TEAMB -----------------------------------

create user teamB IDENTIFIED BY 1234;
GRANT DBA, connect, RESOURCE TO teamB;

------------------------------ DROP TABLE -----------------------------------

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
DROP TABLE promotion_food_menu_img;
DROP TABLE promotion_upload_detail_img;
DROP TABLE promotion_upload_title_img;
DROP TABLE report_master;
DROP TABLE report_member;

------------------------------ DROP SEQUENCE -----------------------------------

DROP SEQUENCE seq_promotion_board;
DROP SEQUENCE seq_promotion_food_menu;
DROP SEQUENCE seq_review_board;
DROP SEQUENCE seq_reply;
DROP SEQUENCE seq_promotion_faq;
DROP SEQUENCE seq_review_faq;
DROP SEQUENCE seq_reply_faq;


------------------------------ CREATE SEQUENCE -----------------------------------

CREATE SEQUENCE seq_promotion_board;
CREATE SEQUENCE seq_promotion_food_menu;
CREATE SEQUENCE seq_review_board;
CREATE SEQUENCE seq_reply;
CREATE SEQUENCE seq_promotion_faq;
CREATE SEQUENCE seq_review_faq;
CREATE SEQUENCE seq_reply_faq;



------------------------------ member -----------------------------------
-- 유저
CREATE TABLE member (
    email VARCHAR2(50) PRIMARY KEY
    , password VARCHAR2(150) NOT NULL
    , nick_name VARCHAR2(30) NOT NULL
    , phone_number VARCHAR2(20) NOT NULL
    , birth NUMBER(8) NOT NULL
    , address VARCHAR2(150) NOT NULL
    , detail_address VARCHAR2(50) NULL
    , extra_address VARCHAR2(50) NULL
    , name VARCHAR2(15) NOT NULL
    , gender VARCHAR2(2) NOT NULL
    , auth VARCHAR2(20) DEFAULT 'COMMON';
    , regist_date DATE DEFAULT SYSDATE
    , login_time DATE
);

--ALTER TABLE member
--MODIFY password VARCHAR2(150);

-- member 주소 크기 변경
--ALTER TABLE member
--MODIFY address VARCHAR2(150);

-- member 기본 일반회원
--ALTER TABLE member
--MODIFY auth VARCHAR2(20) DEFAULT 'COMMON';

-- 실제 주소 입력하기 위해 실제 주소 + 상세 주소 컬럼 추가
--ALTER TABLE member
--ADD detail_address VARCHAR2(50) NULL;

--ALTER TABLE member
--ADD extra_address VARCHAR2(50) NULL;

update member set auth = 'MASTER' WHERE email = 'abc1234@naver.com';

select * from member;

insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('abc1234@naver.com', 'aaaa', '닉네임1', '01012341234', '20000101', '서울 금천구', '서해원', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('bbbb2222@naver.com', '1234', '닉네임2', '01022225555', '20001212', '서울 강남구', '해원서', 'F');

commit;

------------------------------ master -----------------------------------
-- 사업자

CREATE TABLE MASTER (
    business_no VARCHAR2(50) PRIMARY KEY
    , email VARCHAR2(50) NOT NULL
    , master_name VARCHAR2(15) NOT NULL
    , store_name VARCHAR2(50) NOT NULL
    , store_address VARCHAR2(50) NOT NULL
    , store_detail_address VARCHAR2(50) NULL
    , store_extra_address VARCHAR2(50) NULL
    , store_reg_date NUMBER(10)
    , hot_deal VARCHAR2(2) DEFAULT 'N'
    , store_call_number VARCHAR2(20) NOT NULL
    , CONSTRAINT fk_master_email
    FOREIGN KEY (email) REFERENCES member (email) ON DELETE CASCADE
);

-- master 테이블 오픈일자 타입 변경
--alter table master modify STORE_REG_DATE number(10);

--ALTER TABLE master
--ADD store_detail_address VARCHAR2(50) NULL;

--ALTER TABLE master
--ADD store_extra_address VARCHAR2(50) NULL;

-- 카테고리분류 말고 해시태그로 분류
--ALTER TABLE master
--DROP COLUMN food_categories;

SELECT * FROM master;

insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1111', 'abc1234@naver.com', '서해원', '맛있는 금천구 냠냠1', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1112', 'abc1234@naver.com', '마스터', '맛나다 냉면', '서울 금천구 가산동', '010-3222-2333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1113', 'abc1234@naver.com', '누구지', '오우 커피 맛나', '서울 강남구 도곡동', '010-2333-3553');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1114', 'abc1234@naver.com', '황정아', '맛있는 금천구 냠냠2', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1115', 'abc1234@naver.com', '남기원', '맛있는 금천구 냠냠3', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1116', 'abc1234@naver.com', '김동진', '맛있는 금천구 냠냠3', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1117', 'abc1234@naver.com', '최성렬', '맛있는 금천구 냠냠4', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1118', 'abc1234@naver.com', '이름이', '맛있는 금천구 냠냠5', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1119', 'abc1234@naver.com', '넘많아', '맛있는 금천구 냠냠6', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1120', 'abc1234@naver.com', '왜이래', '맛있는 금천구 냠냠7', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, store_call_number)
VALUES('1234-2222-3333-1121', 'abc1234@naver.com', '임시야', '맛있는 금천구 냠냠8', '서울 금천구 가산동', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1122', 'abc1234@naver.com', '재밌어', '맛있는 금천구 냠냠9', '서울 금천구 가산동', 'Y', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1234-2222-3333-1123', 'abc1234@naver.com', '헤헤헤', '맛있는 은평구 냠냠9', '서울 은평구 진관동', 'Y', '010-2222-3333');

commit;

------------------------------ promotion board -----------------------------------
-- 홍보글

CREATE TABLE promotion_board (
    business_no VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) PRIMARY KEY
    , hashTag varchar2(200) not null
    , content CLOB
    , last_updated DATE DEFAULT SYSDATE
    , title VARCHAR2(70)
    , avg_star_rate DECIMAL(3, 2) DEFAULT 0
    , review_cnt NUMBER(10) DEFAULT 0
    , hashTag VARCHAR(2) NOT NULL
    , file_name VARCHAR2(100) NULL
    , file_path CLOB NOT NULL
    , CONSTRAINT fk_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

--ALTER TABLE promotion_board
--ADD avg_star_rate DECIMAL(3, 2) DEFAULT 0;

--ALTER TABLE promotion_board
--ADD review_cnt NUMBER(10) DEFAULT 0;

-- 홍보글테이블에 해쉬태그 컬럼 추가했습니당
--alter table promotion_board add hashTag varchar2(200) not null;

--ALTER TABLE promotion_board
--ADD file_name VARCHAR2(100) NULL;
--
--ALTER TABLE promotion_board
--ADD file_path CLOB NOT NULL;

SELECT * FROM promotion_board;

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
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1123', seq_promotion_board.nextval, '한식 족발 은평구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');

commit;

------------------------------ premiume promotion board -----------------------------------
-- 월정액 가게

CREATE TABLE premiume_promotion_board (
    promotion_bno NUMBER(10) NOT NULL
    , start_date NUMBER(10)
    , end_date NUMBER(10)
    , CONSTRAINT fk_pro_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

--alter table premiume_promotion_board
--MODIFY start_date NUMBER(10);

--alter table premiume_promotion_board
--MODIFY end_date NUMBER(10);

SELECT * FROM premiume_promotion_board;

-- promotion_bno는 promotion_board 테이블에 있는 promotion_bno와 맞춰서 넣어야 해요!
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

COMMIT;

------------------------------ review board -----------------------------------
-- 리뷰

-- 현재 INSERT는 ReviewBoardServiceTest에서 하면 간편해요! 숫자 조정해서 ^^
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

-- 홍보글에 신고 당한 횟수 추가했어요
--alter table review_board
--add report_cnt number(2) default 0;

SELECT * FROM review_board;

COMMIT;

------------------------------ hot deal -----------------------------------
-- 핫딜

CREATE TABLE hot_deal (
    business_no VARCHAR2(50) NOT NULL
    , discount_price NUMBER(5) NOT NULL
    , end_date NUMBER(10)
    , start_date NUMBER(10)
    , CONSTRAINT fk_hotdeal_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

--alter table hot_deal
--MODIFY start_date NUMBER(10);

--alter table hot_deal
--MODIFY end_date NUMBER(10);

SELECT * FROM hot_deal;

INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1234-2222-3333-1122', 8000, 20220809, 20220707);
INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1234-2222-3333-1123', 8000, 20220931, 20220801);

COMMIT;

------------------------------ auto login -----------------------------------
-- 자동로그인

CREATE TABLE auto_login (
    email VARCHAR2(50) NOT NULL
    , session_id VARCHAR2(50) NOT NULL
    , ip_address VARCHAR2(30) NULL
    , logout_time DATE
    , CONSTRAINT fk_auto_login_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 자동로그인이 되면 세션 아이디를 컬럼에 기록할건데 기존 컬럼명이 cookie인게 직관성이 떨어지는거 같아서 session_id로 변경했어요!
--ALTER TABLE auto_login
--RENAME COLUMN cookie TO session_id;

-- ip 주소 당장 활용할 생각이 없는데 만들 때 무지성으로 not null을 걸어놔서 null로 바꾸는 alter 문이에여
--ALTER TABLE auto_login
--MODIFY ip_address VARCHAR2(30) NULL;

------------------------------ promotion food menu -----------------------------------
-- 음식 메뉴

CREATE TABLE promotion_food_menu(
    menu_no NUMBER(5) PRIMARY KEY
    , promotion_bno NUMBER(10) NOT NULL
    , menu_name VARCHAR2(20) NOT NULL
    , price NUMBER(6) NOT NULL
    , CONSTRAINT fk_menu_busi_no FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);




------------------------------ promotion food menu img -----------------------------------
-- 음식 메뉴 파일 업로드

CREATE TABLE promotion_food_menu_img(
         promotion_bno NUMBER(10) NOT NULL
        ,menu_no NUMBER(10) NOT NULL
        , file_path clob
        , file_name VARCHAR2(100) NOT NULL
        , CONSTRAINT fk_pro_food_menu_upload FOREIGN KEY (menu_no)
    REFERENCES promotion_food_menu (menu_no) ON DELETE CASCADE
);

--alter table promotion_food_menu_upload rename to promotion_upload_menu_img;


------------------------------ favorite store -----------------------------------
-- 즐겨찾기


CREATE TABLE favorite_store (
    email VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) NOT NULL -- ȫ����
    , CONSTRAINT fk_fav_email FOREIGN KEY (email) -- ����
    REFERENCES member (email) ON DELETE CASCADE --
    , CONSTRAINT fk_fav_promo_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

------------------------------ reply -----------------------------------
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

------------------------------ review like -----------------------------------
-- 리뷰 좋아요(추천)


CREATE TABLE review_like (
    review_bno NUMBER(10) NOT NULL
    , email VARCHAR2(50) NOT NULL
    , CONSTRAINT fk_like_rev_bno FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
    , CONSTRAINT fk_like_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

------------------------------ promotion faq -----------------------------------
-- 홍보글 신고


CREATE TABLE promotion_faq (
    pr_faq_no NUMBER(10) PRIMARY KEY
    , promotion_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , promotion_writer_email VARCHAR(50) NOT NULL
    , business_no VARCHAR2(50) NOT NULL
);

-- 신고접수 테이블
--ALTER TABLE promotion_faq
--ADD promotion_writer_email VARCHAR2(50) NOT NULL;

--alter table promotion_faq
--add business_no varchar2(50) not null;

------------------------------ review faq -----------------------------------
-- 리뷰글 신고

CREATE TABLE review_faq (
    re_faq_no NUMBER(10) PRIMARY KEY
    , review_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , review_writer_email VARCHAR2(50) NOT NULL
);

--ALTER TABLE review_faq
--ADD review_writer_email VARCHAR2(50) NOT NULL;


------------------------------ reply faq -----------------------------------
-- 댓글 신고

CREATE TABLE reply_faq (
    reply_faq_no NUMBER(10) PRIMARY KEY
    , reply_no NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
    , reply_writer_email VARCHAR2(50) NOT NULL
);

--ALTER TABLE reply_faq
--ADD reply_writer_email VARCHAR2(50) NOT NULL;

------------------------------ promotion_upload -----------------------------------
-- 홍보글 파일 업로드

--CREATE TABLE promotion_upload (
--    promotion_bno NUMBER(10) NOT NULL
--    , file_path CLOB NOT NULL
--    , file_name VARCHAR2(100)
--    , CONSTRAINT fk_pro_upload FOREIGN KEY (promotion_bno)
--    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
--);
--
--DROP TABLE promotion_upload;

------------------------------ promotion upload detail img -----------------------------------


create table promotion_upload_detail_img(
      promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
    , CONSTRAINT fk_pro_upload_detail_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

------------------------------ promotion upload title img (안쓸것같아요) -----------------------------------

create table promotion_upload_title_img(
   promotion_bno NUMBER(10) NOT NULL
    , file_path clob not null
    , file_name VARCHAR2(100) NULL
    , CONSTRAINT fk_pro_upload_title_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);



------------------------------ review upload -----------------------------------
-- 리뷰 파일 업로드

CREATE TABLE review_upload(
    review_bno NUMBER(10) NOT NULL
    , file_path VARCHAR2(150) NOT NULL
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_rev_upload FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
);


------------------------------ profile upload -----------------------------------

CREATE TABLE profile_upload(
    email VARCHAR2(50) PRIMARY KEY
    , file_path VARCHAR2(150) NOT NULL
    , file_name VARCHAR2(100) NOT NULL
    , CONSTRAINT fk_profile_upload FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

------------------------------ receipt upload -----------------------------------
-- 영수증 관련 테이블은 아직~~
-- API를 활용해서 다이렉트로 유효 영수증인지 검증이 끝난 후 결과만을 알려준다면
-- 굳이 테이블을 만들어서 관리할 필요가 없어보여요.
CREATE TABLE receipt_upload();

------------------------------ report member -----------------------------------
-- 신고했을 때 기록 남기는 테이블

CREATE TABLE report_member (
    email VARCHAR2(50) NOT NULL
    , report_cnt NUMBER (2) DEFAULT 1
    , CONSTRAINT fk_report_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

------------------------------ black list -----------------------------------
-- 5번 이상 일 경우 블랙리스트 등록 테이블


CREATE TABLE black_list (
    email VARCHAR2(50) NOT NULL
);

------------------------------ report master -----------------------------------
-- 사업자당 신고당한 횟수 저장하는 테이블 추가할게요


create table report_master (
    business_no VARCHAR2(50) NOT NULL
    , report_cnt NUMBER (2) DEFAULT 1
    , CONSTRAINT fk_report_business_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

------------------------------ black list master -----------------------------------
-- 사업자 블랙리스트도 추가할게요

CREATE TABLE black_list_master (
    business_no VARCHAR2(50) NOT NULL
);


------------------------------ 끝!! -----------------------------------
COMMIT;