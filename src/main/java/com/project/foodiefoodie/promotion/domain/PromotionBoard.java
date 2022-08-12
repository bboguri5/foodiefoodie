package com.project.foodiefoodie.promotion.domain;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PromotionBoard {

        private String businessNo;
        private Long promotionBno;
        private String content;
        private Date lastUpdated;
        private String title;
        private double avgStarRate;
        private Long reviewCnt;
        private int reportCnt;

}
