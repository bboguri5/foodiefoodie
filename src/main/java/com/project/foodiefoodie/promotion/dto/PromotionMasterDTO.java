package com.project.foodiefoodie.promotion.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PromotionMasterDTO {

    private String businessNo;
    private double avgStarRate;
    private Long reviewCnt;
    private String storeName;
    private String storeAddress;
    private char hotDeal;
    private String hashTag;
}
