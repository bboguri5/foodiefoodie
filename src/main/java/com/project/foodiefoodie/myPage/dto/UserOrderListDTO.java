package com.project.foodiefoodie.myPage.dto;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserOrderListDTO {

    private int orderNo ; // 주문번호
    private String storeName; // 가게이름
    private String orderDate; // 주문 시간
    private String orderMenuList; // 주문내역 리스트 // 스트링으로 붙여서 넣어줄꺼임
    private String orderRowMenuList; // 주문내역 세로로 나오는 메서드
    private int totalNum; // 주문한 총 금액 가져올꺼임
    private int discount; // 할인율
    private int realMoney; // 할인율이 계산된 가격

    // 할인율이 계산된 가격


}
