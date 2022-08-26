package com.project.foodiefoodie.review.controller;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Test {
    String menuName;
    int menuPrice;
    int quantity;

    Test(String menuName, int menuPrice) {
        this.menuName = menuName;
        this.menuPrice = menuPrice;
    }
}
