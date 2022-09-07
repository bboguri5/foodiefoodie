package com.project.foodiefoodie.myPage.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {

   private int  orderNo; // 주문번호
   private String orderMenu; // 주문메뉴
   private int menuEa; // 주문 수량
   private int price ; // 가격 -- 총 가격
   private int discount; // 할인율



}
