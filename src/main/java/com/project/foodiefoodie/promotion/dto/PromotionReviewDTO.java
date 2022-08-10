package com.project.foodiefoodie.promotion.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PromotionReviewDTO {

    private String businessNo;
    private double avgStarRate;
    private Long reviewCnt;
}
