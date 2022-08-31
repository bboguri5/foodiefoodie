package com.project.foodiefoodie.myPage.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDTO {


    private int orderNo; // 주문번호
    private String email; // 주문한사람
    private Date orderDate; // 주문 날짜


}
