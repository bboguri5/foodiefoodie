package com.project.foodiefoodie.mainpage.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MainPagePremiumDTO {
    private Long promotionBno;
    private String businessNo;
    private String storeName;
    private String storeAddress;
    private String hashTag;
    private double avgStarRate;
    private Long reviewCnt;
    private char hotDeal;
    private int discountPrice;
}
