
-- 계정 추가 및 권한 부여
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


-- SEQUENCE 생성
CREATE SEQUENCE seq_promotion_board;
CREATE SEQUENCE seq_promotion_food_menu;
CREATE SEQUENCE seq_review_board;
CREATE SEQUENCE seq_reply;
CREATE SEQUENCE seq_promotion_faq;
CREATE SEQUENCE seq_review_faq;
CREATE SEQUENCE seq_reply_faq;


-- TABLE 생성
-- 유저 -- 사장님과 다른 테이블 
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


insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('abc1234@naver.com', 'aaaa', '길동이', '01012341234', '20000101', '서울', '홍길동', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('bbbb2222@naver.com', '1234', '철수', '01022225555', '20001212', '대구', '김철수', 'M');

insert into master (business_no, email, master_name, store_name, store_address, food_categories, store_call_number)
VALUES('1234-2222-3333-1111', 'abc1234@naver.com', '홍길동', '길동이네분식집', '서울 강서구 가양동', '분식', '010-2222-3333');

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
-- 자동로그인
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

-- 사업자-- 사업자와 일반 사용자 테이블 구분 
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
alter table master modify STORE_REG_DATE number(10);

ALTER TABLE master
DROP COLUMN food_categories;
commit;

-- 홍보글
CREATE TABLE promotion_board (
    business_no VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) PRIMARY KEY
    , content CLOB
    , last_updated DATE DEFAULT SYSDATE
    , title VARCHAR2(70)
    , CONSTRAINT fk_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);

SELECT * FROM promotion_board;

ALTER TABLE promotion_board DROP COLUMN avg_star_rate;
ALTER TABLE promotion_board DROP COLUMN review_cnt;

ALTER TABLE promotion_board
ADD avg_star_rate DECIMAL(1, 2) DEFAULT 0;

ALTER TABLE promotion_board
ADD review_cnt NUMBER(10) DEFAULT 0;

COMMIT;


ALTER TABLE promotion_board
ADD avg_star_rate DECIMAL(1, 2);

insert into promotion_board VALUES (101010
,seq_promotion_board.nextval
,'주소   : 경기도 군포시 산본로323번길 7-1
지번 : 경기도 군포시 산본동 1128-1
전화번호 : 0507-1350-4556
음식 종류 :   딤섬 / 만두
가격대 : 만원 미만
주차   : 주차공간없음
영업시간 : 11:00 - 21:00
쉬는시간 : 15:00 - 16:00
마지막 주문 : 20:30
휴일   : 일'
,sysdate
,'황고기')
;


-- 음식 메뉴
CREATE TABLE promotion_food_menu(
    menu_no NUMBER(5) PRIMARY KEY
    , promotion_bno NUMBER(10) NOT NULL
    , menu_name VARCHAR2(20) NOT NULL
    , price NUMBER(6) NOT NULL
    , CONSTRAINT fk_menu_busi_no FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- 음식 메뉴 파일 업로드
CREATE TABLE promotion_food_menu_upload(
         promotion_bno NUMBER(10) NOT NULL
        ,menu_no NUMBER(10) NOT NULL 
        , file_path clob
        , file_name VARCHAR2(100) NOT NULL
        , CONSTRAINT fk_pro_food_menu_upload FOREIGN KEY (menu_no)
    REFERENCES promotion_food_menu (menu_no) ON DELETE CASCADE
);

-- 월정액 가게
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
    , CONSTRAINT fk_review_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 핫딜
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



-- 즐겨찾기 
CREATE TABLE favorite_store (
    email VARCHAR2(50) NOT NULL
    , promotion_bno NUMBER(10) NOT NULL -- 홍보글 
    , CONSTRAINT fk_fav_email FOREIGN KEY (email) -- 내용 
    REFERENCES member (email) ON DELETE CASCADE -- 
    , CONSTRAINT fk_fav_promo_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

select * from favorite_store;

insert into 


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
);

ALTER TABLE promotion_faq
ADD promotion_writer_email VARCHAR2(50) NOT NULL;




-- 리뷰글 신고
CREATE TABLE review_faq (
    re_faq_no NUMBER(10) PRIMARY KEY
    , review_bno NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
);

ALTER TABLE review_faq
ADD review_writer_email VARCHAR2(50) NOT NULL;

-- 댓글 신고
CREATE TABLE reply_faq (
    reply_faq_no NUMBER(10) PRIMARY KEY
    , reply_no NUMBER(10) NOT NULL
    , writer_email VARCHAR2(50) NOT NULL
    , content CLOB
    , faq_complete VARCHAR2(2) DEFAULT 'F'
);

ALTER TABLE reply_faq
ADD reply_writer_email VARCHAR2(50) NOT NULL;


---- 홍보글 파일 업로드
--CREATE TABLE promotion_upload (
--    promotion_bno NUMBER(10) NOT NULL
--    , file_path CLOB NOT NULL
--    , file_name VARCHAR2(100)
--    , CONSTRAINT fk_pro_upload FOREIGN KEY (promotion_bno)
--    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
--);
--
--DROP TABLE promotion_upload; 

홍보글 이미지 대분류해서 넣는게 나을거같아요 메인에서 타이틀 사진 표시할 때 연계될 수 있도록 ! 
그래서 그냥 테이블 3가지로 나눴어요 ! 메뉴이미지테이블은 기존에 있던거 이름만 변경 !  

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

-- 영수증 관련 테이블은 아직~~
-- API를 활용해서 다이렉트로 유효 영수증인지 검증이 끝난 후 결과만을 알려준다면
-- 굳이 테이블을 만들어서 관리할 필요가 없어보여요.
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

commit ;


