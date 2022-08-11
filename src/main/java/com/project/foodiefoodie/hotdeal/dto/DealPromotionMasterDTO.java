package com.project.foodiefoodie.hotdeal.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DealPromotionMasterDTO {

    private String businessNo;
    private int discountPrice;
    private Long endDate;
    private Long startDate;
    private double avgStarRate;
    private Long reviewCnt;
    String storeName;
    String storeAddress;
    char hotDeal;
}
