
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

commit;


-- TABLE 생성
-- 유저
CREATE TABLE member (
    email VARCHAR(50) PRIMARY KEY
    , password VARCHAR(150) NOT NULL
    , nick_name VARCHAR(30) NOT NULL
    , phone_number VARCHAR(20) NOT NULL
    , birth INT(8) NOT NULL
    , address VARCHAR(150) NOT NULL
    , name VARCHAR(15) NOT NULL
    , gender VARCHAR(2) NOT NULL
    , auth VARCHAR(20) DEFAULT 'COMMON'
    , regist_date DATE DEFAULT current_timestamp
    , detail_address VARCHAR(50)
    , extra_address VARCHAR(50)
);


-- 자동로그인
CREATE TABLE auto_login (
    email VARCHAR(50) NOT NULL
    , session_id VARCHAR(50) NOT NULL
    , logout_time DATE
    , CONSTRAINT fk_auto_login_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 사업자
CREATE TABLE master (
    business_no VARCHAR(50) PRIMARY KEY
    , email VARCHAR(50) NOT NULL
    , master_name VARCHAR(15) NOT NULL
    , store_name VARCHAR(50) NOT NULL
    , store_address VARCHAR(150) NOT NULL
    , hot_deal VARCHAR(3) DEFAULT 'OFF'
    , store_call_number VARCHAR(20) NOT NULL
    , store_detail_address VARCHAR(50) NULL
    , store_extra_address VARCHAR(50) NULL
    , promotion_auth varchar(20) default 'COMMON'
    , CONSTRAINT fk_master_email
    FOREIGN KEY (email) REFERENCES member (email) ON DELETE CASCADE
);



-- 홍보글
CREATE TABLE promotion_board (
    business_no VARCHAR(50) NOT NULL
    , promotion_bno INT(10) AUTO_INCREMENT
    , content TEXT
    , last_updated DATE DEFAULT CURRENT_TIMESTAMP
    , title VARCHAR(70)
    , avg_star_rate DECIMAL(3, 2) DEFAULT 0
    , review_cnt INT(10) DEFAULT 0
    , hashTag varchar(200) not null
    , report_cnt INT(2) default 0
    , CONSTRAINT fk_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
    , constraint pk_promo_bno primary key (promotion_bno)
);




-- 리뷰
CREATE TABLE review_board (
    email VARCHAR(50) NOT NULL
    , title VARCHAR(70) NOT NULL
    , content TEXT
    , review_bno INT(10) AUTO_INCREMENT
    , business_no VARCHAR(50) NULL
    , last_updated DATE DEFAULT CURRENT_TIMESTAMP
    , like_cnt INT(8) DEFAULT 0
    , star_rate INT(2) DEFAULT 5
    , private VARCHAR(2) DEFAULT 'F'
    , report_cnt INT(2) default 0
    , store_name VARCHAR(50) NOT NULL
    , store_address VARCHAR(150) NOT NULL
    , store_detail_address VARCHAR(50) NULL
    , store_extra_address VARCHAR(50) NULL
    , CONSTRAINT fk_review_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , constraint pk_review_bno primary key (review_bno)
);


-- 핫딜
CREATE TABLE hot_deal (
    business_no VARCHAR(50) NOT NULL
    , discount_price INT(5) NOT NULL
    , CONSTRAINT fk_hotdeal_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);


-- 즐겨찾기
CREATE TABLE favorite_store (
    email VARCHAR(50) NOT NULL
    , promotion_bno INT(10) NOT NULL
    , CONSTRAINT fk_fav_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , CONSTRAINT fk_fav_promo_bno FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);

-- 리뷰글에 대한 댓글
CREATE TABLE reply (
    review_bno INT(10) NOT NULL
    , reply_no INT(10) AUTO_INCREMENT
    , email VARCHAR(50) NOT NULL
    , content TEXT
    , nick_name VARCHAR(30) NOT NULL
    , last_updated DATE DEFAULT CURRENT_TIMESTAMP
    , CONSTRAINT fk_rep_rev_bno FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
    , CONSTRAINT fk_rep_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , constraint pk_rep_no primary key (reply_no)
);

-- 리뷰 좋아요(추천)
CREATE TABLE review_like (
    review_bno INT(10) NOT NULL
    , email VARCHAR(50) NOT NULL
    , CONSTRAINT fk_like_rev_bno FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
    , CONSTRAINT fk_like_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 홍보글 신고
CREATE TABLE promotion_faq (
    pr_faq_no INT(10) AUTO_INCREMENT
    , promotion_bno INT(10) NOT NULL
    , writer_email VARCHAR(50) NOT NULL
    , content TEXT
    , faq_complete VARCHAR(2) DEFAULT 'F'
    , promotion_writer_email VARCHAR(50) NOT NULL
    , business_no varchar(50) not null
    , constraint pk_pr_faq_no primary key (pr_faq_no)
);


-- 리뷰글 신고
CREATE TABLE review_faq (
    re_faq_no INT(10) AUTO_INCREMENT
    , review_bno INT(10) NOT NULL
    , writer_email VARCHAR(50) NOT NULL
    , content TEXT
    , faq_complete VARCHAR(2) DEFAULT 'F'
    , review_writer_email VARCHAR(50) NOT NULL
    , constraint pk_re_faq_no primary key (re_faq_no)
);


-- 댓글 신고
CREATE TABLE reply_faq (
    reply_faq_no INT(10) AUTO_INCREMENT
    , reply_no INT(10) NOT NULL
    , writer_email VARCHAR(50) NOT NULL
    , reply_faq_content TEXT
    , faq_complete VARCHAR(2) DEFAULT 'F'
    , reply_writer_email VARCHAR(50) NOT NULL
    , constraint pk_reply_faq_no primary key (reply_faq_no)
);


-- 리뷰 파일 업로드
CREATE TABLE review_upload(
    review_bno INT(10) NOT NULL
    , file_path TEXT not null
    , file_name VARCHAR(100) NOT NULL
    , file_size INT(20)
    , file_type varchar(10)
    , file_byte TEXT
    , file_data TEXT
    , CONSTRAINT fk_rev_upload FOREIGN KEY (review_bno)
    REFERENCES review_board (review_bno) ON DELETE CASCADE
);



-- 신고처리된 내역있는 일반유저
CREATE TABLE report_member (
    email VARCHAR(50) NOT NULL
    , report_cnt INT (2) DEFAULT 1
    , CONSTRAINT fk_report_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
);

-- 블랙리스트 (일반유저)
CREATE TABLE black_list (
    email VARCHAR(50) NOT NULL
);


-- 신고처리된 내역있는 사업자
create table report_master (
    business_no VARCHAR(50) NOT NULL
    , report_cnt INT (2) DEFAULT 1
    , CONSTRAINT fk_report_business_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
);


-- 블랙리스트 (사업자)
CREATE TABLE black_list_master (
    business_no VARCHAR(50) NOT NULL
);


-- 홍보글 상세 이미지
create table promotion_upload_detail_img(
      promotion_bno INT(10) NOT NULL
    , file_path TEXT not null
    , file_name VARCHAR(100) NULL
    , file_mediatype varchar(10)
    , file_size INT(20)
    , file_byte TEXT
    , file_data TEXT
    , CONSTRAINT fk_pro_upload_detail_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);



-- 홍보글 메인이미지
create table promotion_upload_title_img(
   promotion_bno INT(10) NOT NULL
    , file_path TEXT not null
    , file_name VARCHAR(100) NULL
    , file_mediatype varchar(10)
    , file_size INT(20)
    , file_byte TEXT
    , file_data TEXT
    , CONSTRAINT fk_pro_upload_title_img FOREIGN KEY (promotion_bno)
    REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
);





-- 영업시간
 create table promotion_store_time
    (
        promotion_bno INT(10) NOT NULL
        ,weekdayOpenTime varchar(10) NOT NULL
        ,weekdayCloseTime varchar(10) NOT NULL
        ,weekendOpenTime varchar(10) NOT NULL
        ,weekendCloseTime varchar(10) NOT NULL
        ,breakStartTime varchar(10) NOT NULL
        ,breakEndTime varchar(10) NOT NULL
        ,closedDay VARCHAR(20)
        , CONSTRAINT fk_store_time_promotion_bno FOREIGN KEY (promotion_bno)
        REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
    );

-- 음식 메뉴
CREATE TABLE promotion_food_menu(
        menu_no INT(5) AUTO_INCREMENT
        , promotion_bno INT(10) NOT NULL
        , menu_name varchar(100) NOT NULL
        , price INT(6) NOT NULL
        , CONSTRAINT fk_menu_busi_no FOREIGN KEY (promotion_bno)
        REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
        , constraint pk_menu_no primary key (menu_no)
    );

CREATE TABLE order_list (
    order_no INT(8) AUTO_INCREMENT
    , business_no VARCHAR(50) NOT NULL
    , CONSTRAINT fk_order_busi_no FOREIGN KEY (business_no)
    REFERENCES master (business_no) ON DELETE CASCADE
    , email VARCHAR(50) NOT NULL
    , CONSTRAINT fk_order_email FOREIGN KEY (email)
    REFERENCES member (email) ON DELETE CASCADE
    , order_date DATE DEFAULT CURRENT_TIMESTAMP -- 주문 날짜
    , constraint pk_order_no primary key (order_no)
);



CREATE TABLE order_detail (
    order_no INT(8) NOT NULL
    , CONSTRAINT fk_order_no FOREIGN KEY (order_no)
    REFERENCES order_list (order_no) ON DELETE CASCADE
    , order_menu VARCHAR(50) NOT NULL
    , menu_ea INT(2) NOT NULL
    , price INT(10) NOT NULL
    , discount INT(3) null
);

create table promotion_notice
(
promotion_bno INT(10),
notice_no INT(10) AUTO_INCREMENT,
content varchar(300) NOT NULL,
update_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
CONSTRAINT fk_promotion_bno_notice FOREIGN KEY (promotion_bno)
REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE,
constraint pk_notice_no primary key (notice_no)
);



create table promotion_upload_menu_img (
        promotion_bno INT(10)
        , menu_no INT(5)
        ,file_path TEXT
        ,file_name varchar(100)
        ,file_mediatype varchar(20)
        ,file_size INT(20)
        ,file_byte TEXT
        ,file_data TEXT
        ,CONSTRAINT fk_promotion_bno_menu_img FOREIGN KEY (promotion_bno)
              REFERENCES promotion_board (promotion_bno) ON DELETE CASCADE
        ,CONSTRAINT fk_menu_no_menu_img FOREIGN KEY (menu_no)
              REFERENCES promotion_food_menu (menu_no) ON DELETE CASCADE
);



COMMIT;




-- 영수증 관련 테이블은 아직~~
-- API를 활용해서 다이렉트로 유효 영수증인지 검증이 끝난 후 결과만을 알려준다면
-- 굳이 테이블을 만들어서 관리할 필요가 없어보여요.
--CREATE TABLE receipt_upload();

-- 추가





-----------------------------------
