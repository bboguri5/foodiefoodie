
----------------------------------------------------------------------------------------------------------------------- mapper
--  insert
insert into promotion_board VALUES (
101010
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


-- selectOne
SELECT *
FROM promotion_board
where business_no = 101010;

-- modify
UPDATE promotion_board SET content = '에잉??', last_updated = sysdate, title = '황사장';

-- delete
DELETE FROM promotion_board WHERE promotion_bno = 7;

-------------------------------------------------------------------------------------------------------------------------/mapper

------------------------------------------------------------------------------------------------------------------------- test data
-- member insert
insert into member (email, password, nick_name, phone_number, birth, address, name, gender, auth)
VALUES('jungah@naver.com', '1234', '홍길동', '01012341234', '20000101', '서울', '홍길동', 'M','MASTER');

-- master insert
insert into master(business_no,email,master_name,store_name,store_address,store_reg_date,store_call_number)VALUES
(
'101010'
,'jungah@naver.com'
,'황정아'
,'황고기'
,'서울특별시 금천구 가산동 345-30 남성프라자 10층 1007호'
,20200101,'01096221143'
);

rollback;
commit;

------------------------------------------------------------------------------------------------------------------------------------- / test data