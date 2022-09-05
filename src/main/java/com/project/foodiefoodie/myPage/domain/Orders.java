package com.project.foodiefoodie.myPage.domain;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Orders {

    private int orderNo; // 주문번호
    private String businessNo; //
    private String email; //
    private Date orderDate; // 주문 날짜

}
