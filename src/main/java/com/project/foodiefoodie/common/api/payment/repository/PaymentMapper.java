package com.project.foodiefoodie.common.api.payment.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

    // 주문 번호가 생성되고 주문 일자가 현재 날짜로 들어감.
    void insertOrderList(String email, String businessNo);


    // order_detail 테이블에 메뉴, 수량, 가격 등의 세부사항 기록을 위해 직전 생성된 주문번호가 뭔지 확인.
    int findCurrentOrderNo(String email, String businessNo);


    // 위에서 찾은 현재 주문 번호로 사용자가 주문한 메뉴, 수량, 가격에 대한 정보를 DB에 저장.
    void insertOrderDetail(int orderNo, String menu, int quantity, int price, int discount);
}
