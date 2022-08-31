package com.project.foodiefoodie.myPage.dto;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderNoAndStoreNameDTO {

    private int orderNo ; // 주문번호
    private String storeName; // 가게이름
    private Date orderDate; // 주문 시간


}
