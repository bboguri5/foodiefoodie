-- 스케줄러 설정하는 법 (광고 종료 실행)
-- 스케줄러가 설정한 시간에 설정한 반복 횟수로 해당 프로시저를 작동하는 원리
-- 1. 프로시저 -> 새 프로시저 생성 (스키마 : teamB, 이름 : 원하시는대로 - ex) SP_PREMIUM_BOARD_UPDATE)
-- 2. begin, end 사이에 실행시킬 sql 작성
    -- update premiume_promotion_board set complete = 'N'
    -- where end_date = to_number(to_char(sysdate,'yyyymmdd'))
    -- and complete = 'T';
-- 3. 스케줄러 -> 작업 -> 새 작업
    -- 작업이름 : 원하시는대로 ex) SH_PREMIUM_BOARD_UPDATE
    -- 설명 : 적고싶은대로~ ex) 오전 1시 마다 premium 종료일자가 현재일자 이전인 객체 값 변환
    -- 작업 클래스 : SYS.DEFAULT_JOB_CLASS
    -- 작업유형 : 내장프로시저, 스키마-teamB, 프로시저-만드신 프로시저
    -- 작업실행시간 : 반복, 반복간격: 오른쪽 버튼 클릭, 시작,종료날짜 입력안하면 무한반복
    -- 반복간격 버튼 클릭 이후 : 매-1,DAILY 시간-01:00:00 , 확인 버튼클릭
    -- 적용!


-- admin
-- 먼저 admin@naver.com으로 회원가입 해주시구 업데이트문 돌려주세용~
update member set auth = 'ADMIN' where email = 'admin@naver.com';

-- member (common)
delete from member
where email = 'admin@naver.com';


insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('bbbb2222@naver.com', '1234', '닉네임2', '01022225555', '20001212', '서울 강남구', '해원서', 'F');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('ccc3333@naver.com', 'cccc', '닉네임3', '01033332222', '20030303', '서울 강서구', '이름3', 'F');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('ddd4444@naver.com', 'dddd', '닉네임4', '01044443333', '20040404', '부산 사상구', '이름4', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('eee5555@naver.com', 'eeee', '닉네임5', '01055554444', '20050505', '부산 해운대구', '이름5', 'F');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('fff6666@naver.com', 'ffff', '닉네임6', '01066664444', '20060606', '제주 서귀포시', '이름6', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('ggg7777@naver.com', 'gggg', '닉네임7', '01077776666', '20070707', '제주 제주시', '이름7', 'F');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('hhh8888@naver.com', 'hhhh', '닉네임8', '01088887777', '20080808', '서울 중구', '이름8', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('iii9999@naver.com', 'iiii', '닉네임9', '01099998888', '20090909', '서울 용산구', '이름9', 'M');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender)
VALUES('jjj1010@naver.com', 'jjjj', '닉네임10', '01010101010', '20101010', '서울 중구', '이름10', 'F');

SELECT * FROM member
WHERE auth = 'COMMON';


-- member (master)
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('abc1234@naver.com', 'aaaa', '닉네임1', '01012341234', '20000101', '서울 금천구', '서해원', 'F', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('one123@naver.com', '1111', '사업자1', '01011112222', '19960101', '서울 마포구', '현준', 'M', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('two123@naver.com', '2222', '사업자2', '01022223333', '19981014', '서울 용산구', '지훈', 'M', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('three123@naver.com', '3333', '사업자3', '01033334444', '19990504', '서울 강동구', '민수', 'M', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('four123@naver.com', '4444', '사업자4', '01044445555', '20011213', '서울 은평구', '민지', 'F', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('five123@naver.com', '5555', '사업자5', '01055556666', '19950408', '서울 동작구', '수빈', 'F', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('six123@naver.com', '6666', '사업자6', '01066667777', '19920520', '서울 강서구', '유진', 'F', 'MASTER');
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('seven123@naver.com', '7777', '사업자7', '01077778888', '19930821', '서울 강남구', '민서', 'F', 'MASTER');



select * from member
WHERE auth = 'MASTER';
COMMIT;

-- master
delete from master;

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
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0001', 'one123@naver.com', '사업자1', '가게이름1', '서울 마포구 상암동', 'Y', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0002', 'two123@naver.com', '사업자2', '가게이름2', '서울 용산구 한남동', 'N', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0003', 'three123@naver.com', '사업자3', '가게이름3', '서울 강동구 상일동', 'N', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0004', 'four123@naver.com', '사업자4', '가게이름4', '서울 은형구 신사동', 'Y', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0005', 'five123@naver.com', '사업자5', '가게이름5', '서울 동작구 대방동', 'N', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0006', 'six123@naver.com', '사업자6', '가게이름6', '서울 강서구 가양동', 'Y', '010-2222-3333');
insert into master (business_no, email, master_name, store_name, store_address, hot_deal, store_call_number)
VALUES('1111-2222-3333-0007', 'seven123@naver.com', '사업자7', '가게이름7', '서울 강남구 역삼동', 'N', '010-2222-3333');


SELECT * FROM master;
COMMIT;

-- promotion_board
delete from promotion_board;


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
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1122', seq_promotion_board.nextval, '한식 족발 금천구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1234-2222-3333-1123', seq_promotion_board.nextval, '한식 족발 은평구 맛집', '내용입니다요오오오오', '제목이구요오오오', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0001', seq_promotion_board.nextval, '일식 초밥 마포구 맛집', '다', '오', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0002', seq_promotion_board.nextval, '한식 김치찌개 용산구 맛집', '들', '세', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0003', seq_promotion_board.nextval, '중식 짜장면 강동구 맛집', '휴', '요', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0004', seq_promotion_board.nextval, '일식 라멘 은평구 맛집', '가', '1', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0005', seq_promotion_board.nextval, '한식 족발 동작구 맛집', '잘', '2', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0006', seq_promotion_board.nextval, '한식 족발 강서구 맛집', '쉬', '3', 'img/main_background.jpg');
INSERT INTO promotion_board (business_no, promotion_bno, hashTag, content, title, file_path)
VALUES ('1111-2222-3333-0007', seq_promotion_board.nextval, '한식 족발 강남구 맛집', '고', '4', 'img/main_background.jpg');





SELECT * FROM promotion_board;
COMMIT;

-- preminume_promotion_board
-- promotion_bno는 promotion_board 테이블에 있는 promotion_bno와 맞춰서 넣어야 해요!
delete from premiume_promotion_board;

INSERT INTO premiume_promotion_board
VALUES(1, 20220101, 20220830, 'T');
INSERT INTO premiume_promotion_board
VALUES(2, 20220101, 20220831, 'F');
INSERT INTO premiume_promotion_board
VALUES(3, 20220101, 20220826, 'T');
INSERT INTO premiume_promotion_board
VALUES(4, 20220101, 20220912, 'F');
INSERT INTO premiume_promotion_board
VALUES(5, 20220101, 20220913, 'F');
INSERT INTO premiume_promotion_board
VALUES(6, 20220101, 20220915, 'F');
INSERT INTO premiume_promotion_board
VALUES(7, 20220101, 20220825, 'T');
INSERT INTO premiume_promotion_board
VALUES(8, 20220101, 20220826, 'F');


SELECT * FROM premiume_promotion_board;
COMMIT;


-- hot deal
INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1234-2222-3333-1122', 8000, 20220809, 20220707);
INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1234-2222-3333-1123', 8000, 20220931, 20220801);
INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1111-2222-3333-0001', 8000, 20220931, 20220801);
INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1111-2222-3333-0004', 8000, 20220931, 20220801);
INSERT INTO hot_deal (business_no, discount_price, end_date, start_date)
VALUES ('1111-2222-3333-0006', 8000, 20220931, 20220801);


SELECT * FROM hot_deal;
COMMIT;


-- review_board
INSERT INTO review_board (email, title, content, review_bno, business_no, star_rate)
VALUES ('ccc3333@naver.com', '리뷰데이터1', '리뷰데이터내용1', seq_review_board.nextval, '1111-2222-3333-0001', 3);
INSERT INTO review_board (email, title, content, review_bno, business_no, star_rate)
VALUES ('ddd4444@naver.com', '리뷰데이터2', '리뷰데이터내용2', seq_review_board.nextval, '1111-2222-3333-0002', 3);
INSERT INTO review_board (email, title, content, review_bno, business_no, star_rate)
VALUES ('eee5555@naver.com', '리뷰데이터3', '리뷰데이터내용3', seq_review_board.nextval, '1111-2222-3333-0003', 2);
INSERT INTO review_board (email, title, content, review_bno, business_no, star_rate)
VALUES ('fff6666@naver.com', '리뷰데이터4', '리뷰데이터내용4', seq_review_board.nextval, '1111-2222-3333-0004', 4);
INSERT INTO review_board (email, title, content, review_bno, business_no, star_rate)
VALUES ('ggg7777@naver.com', '리뷰데이터5', '리뷰데이터내용5', seq_review_board.nextval, '1111-2222-3333-0005', 5);


select * from review_board;
commit;



-- reply
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (1, seq_reply.nextval, 'jjj1010@naver.com', '댓글데이터1', '닉네임10');
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (2, seq_reply.nextval, 'jjj1010@naver.com', '댓글데이터2', '닉네임10');
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (3, seq_reply.nextval, 'ggg7777@naver.com', '댓글데이터3', '닉네임7');
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (4, seq_reply.nextval, 'ddd4444@naver.com', '댓글데이터4', '닉네임4');
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (5, seq_reply.nextval, 'ddd4444@naver.com', '댓글데이터5', '닉네임4');
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (3, seq_reply.nextval, 'fff6666@naver.com', '댓글데이터6', '닉네임6');
INSERT INTO reply (review_bno, reply_no, email, content, nick_name)
VALUES (3, seq_reply.nextval, 'eee5555@naver.com', '댓글데이터7', '닉네임5');



COMMIT;


-- promotion_faq
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no)
VALUES (seq_promotion_faq.nextval, 14, 'jjj1010@naver.com', '홍보글신고데이터1', 'one123@naver.com', '1111-2222-3333-0001');
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no)
VALUES (seq_promotion_faq.nextval, 15, 'jjj1010@naver.com', '홍보글신고데이터2', 'two123@naver.com', '1111-2222-3333-0002');
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no)
VALUES (seq_promotion_faq.nextval, 16, 'jjj1010@naver.com', '홍보글신고데이터3', 'three123@naver.com', '1111-2222-3333-0003');
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no)
VALUES (seq_promotion_faq.nextval, 17, 'jjj1010@naver.com', '홍보글신고데이터4', 'four123@naver.com', '1111-2222-3333-0004');
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no)
VALUES (seq_promotion_faq.nextval, 18, 'jjj1010@naver.com', '홍보글신고데이터5', 'five123@naver.com', '1111-2222-3333-0005');

INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no, faq_complete)
VALUES (seq_promotion_faq.nextval, 18, 'jjj1010@naver.com', '홍보글신고데이터6', 'five123@naver.com', '1111-2222-3333-0005', 'T');
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no, faq_complete)
VALUES (seq_promotion_faq.nextval, 7, 'jjj1010@naver.com', '홍보글신고데이터7', 'abc1234@naver.com', '1234-2222-3333-1117', 'T');
INSERT INTO promotion_faq (pr_faq_no, promotion_bno, writer_email, content, promotion_writer_email, business_no, faq_complete)
VALUES (seq_promotion_faq.nextval, 11, 'jjj1010@naver.com', '홍보글신고데이터8', 'abc1234@naver.com', '1234-2222-3333-1121', 'T');


commit;

-- review_faq
INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email)
VALUES(seq_review_faq.nextval, 1, 'jjj1010@naver.com', '리뷰신고데이터1', 'ccc3333@naver.com');
INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email)
VALUES(seq_review_faq.nextval, 2, 'jjj1010@naver.com', '리뷰신고데이터2', 'ddd4444@naver.com');
INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email)
VALUES(seq_review_faq.nextval, 3, 'jjj1010@naver.com', '리뷰신고데이터3', 'eee5555@naver.com');
INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email)
VALUES(seq_review_faq.nextval, 4, 'jjj1010@naver.com', '리뷰신고데이터4', 'fff6666@naver.com');
INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email)
VALUES(seq_review_faq.nextval, 5, 'jjj1010@naver.com', '리뷰신고데이터5', 'ggg7777@naver.com');

INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email, faq_complete)
VALUES(seq_review_faq.nextval, 5, 'jjj1010@naver.com', '리뷰신고데이터6', 'four123@naver.com', 'T');
INSERT INTO review_faq (re_faq_no, review_bno, writer_email, content, review_writer_email, faq_complete)
VALUES(seq_review_faq.nextval, 5, 'jjj1010@naver.com', '리뷰신고데이터6', 'ggg7777@naver.com', 'T');


COMMIT;


-- reply_faq
INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email)
VALUES(seq_reply_faq.nextval, 1, 'hhh8888@naver.com', '댓글신고데이터1', 'jjj1010@naver.com');
INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email)
VALUES(seq_reply_faq.nextval, 2, 'hhh8888@naver.com', '댓글신고데이터2', 'jjj1010@naver.com');
INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email)
VALUES(seq_reply_faq.nextval, 3, 'hhh8888@naver.com', '댓글신고데이터3', 'ggg7777@naver.com');
INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email)
VALUES(seq_reply_faq.nextval, 4, 'hhh8888@naver.com', '댓글신고데이터4', 'ddd4444@naver.com');
INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email)
VALUES(seq_reply_faq.nextval, 5, 'hhh8888@naver.com', '댓글신고데이터5', 'ddd4444@naver.com');


INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email, faq_complete)
VALUES(seq_reply_faq.nextval, 5, 'hhh8888@naver.com', '댓글신고데이터6', 'six123@naver.com', 'T');
INSERT INTO reply_faq(reply_faq_no, reply_no, writer_email, reply_faq_content, reply_writer_email, faq_complete)
VALUES(seq_reply_faq.nextval, 5, 'hhh8888@naver.com', '댓글신고데이터7', 'six123@naver.com', 'T');

select * from reply_faq;

COMMIT;


-- report_member
INSERT INTO report_member
VALUES('ggg7777@naver.com', 1);
INSERT INTO report_member
VALUES('four123@naver.com', 2);
INSERT INTO report_member
VALUES('six123@naver.com', 4);




COMMIT;


-- report_master
INSERT INTO report_master
VALUES('1234-2222-3333-1117', 1);
INSERT INTO report_master
VALUES('1234-2222-3333-1121', 2);
INSERT INTO report_master
VALUES('1111-2222-3333-0005', 1);



COMMIT;


-- black_list
INSERT INTO black_list
VALUES('blackList1@naver.com');
INSERT INTO black_list
VALUES('blackList2@naver.com');
INSERT INTO black_list
VALUES('blackList3@naver.com');



COMMIT;

-- black_list_master
INSERT INTO black_list_master
VALUES('9999-1111-4444-1111');
INSERT INTO black_list_master
VALUES('9999-1111-4444-2222');
INSERT INTO black_list_master
VALUES('9999-1111-4444-3333');



COMMIT;


----------------------------------------------------------------------


-- DELETE
DELETE FROM black_list;
DELETE FROM black_list_master;
DELETE FROM report_member;
DELETE FROM report_master;
DELETE FROM promotion_upload_title_img;
DELETE FROM promotion_upload_menu_img;
DELETE FROM promotion_upload_detail_img;
DELETE FROM promotion_food_menu;
DELETE FROM profile_upload;
DELETE FROM review_upload;
DELETE FROM reply_faq;
DELETE FROM review_faq;
DELETE FROM promotion_faq;
DELETE FROM review_like;
DELETE FROM reply;
DELETE FROM favorite_store;
DELETE FROM hot_deal;
DELETE FROM review_board;
DELETE FROM premiume_promotion_board;
DELETE FROM promotion_board;
DELETE FROM MASTER;
DELETE FROM auto_login;
DELETE FROM member;



COMMIT;



