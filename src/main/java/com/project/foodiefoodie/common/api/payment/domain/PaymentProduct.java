package com.project.foodiefoodie.common.api.payment.domain;

import lombok.*;

import java.util.List;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class PaymentProduct {

    private List<String> menu; // 메뉴 이름들이 담긴 리스트
    private int totalQuantity; // 주문 수량 (메뉴들의 총 수량) 파스타 2개, 치킨 1개 이런식이면 3이 되도록!
    private int totalPrice; // 최종적으로 결제해야할 금액
}
