package com.project.foodiefoodie.premium.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PremiumPromotionBoardDTO {
    private Long promotionBno;
    private String businessNo;
    private double avgStarRate;
    private Long reviewCnt;
    String storeName;
    String storeAddress;
    char hotDeal;
}
