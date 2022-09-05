package com.project.foodiefoodie.myPage.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MenuAndEaDTO {


    private String orderMenu; // 주문메뉴
    private int menuEa; // 주문 수량
}
