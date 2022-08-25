package com.project.foodiefoodie.common.api.payment.dto;

import lombok.*;

import java.util.List;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class OrderInfoDTO {
    
    private String businessNo; // 주문이 들어가는 가게의 사업자 번호
    private List<String> menu; // 메뉴 이름들이 담긴 리스트
    private int totalQuantity; // 주문 수량 (메뉴들의 총 수량) 파스타 2개, 치킨 1개 이런식이면 3이 되도록!
    private int totalPrice; // 최종적으로 결제해야할 금액
}
