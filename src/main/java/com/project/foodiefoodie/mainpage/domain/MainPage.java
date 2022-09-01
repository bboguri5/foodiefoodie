package com.project.foodiefoodie.mainpage.domain;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MainPage {
    private long promotionBno;
    private String businessNo;
    private String storeName;
    private String storeAddress;
    private String hashTag;
    private double avgStarRate;
    private Long reviewCnt;
    private String hotDeal;
    private int discountPrice;
    private String isOpen;
}
