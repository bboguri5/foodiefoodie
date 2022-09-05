package com.project.foodiefoodie.myPage.domain;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PromotionFoodMenu {

    // 가게 메뉴
    private int menuNo;
    private int promotionBno;
    private String menuName;
    private int price;



}
