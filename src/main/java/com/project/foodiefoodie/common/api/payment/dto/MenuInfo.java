package com.project.foodiefoodie.common.api.payment.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MenuInfo {

//    private String businessNo; // 주문이 들어가는 가게의 사업자 번호
    private String menuName; // 메뉴 이름
    private int quantity; // 주문 수량
    private int menuPrice; // 주문 금액

    MenuInfo(String menu, int price) {
        this.menuName = menu;
        this.menuPrice= price;
    }

}