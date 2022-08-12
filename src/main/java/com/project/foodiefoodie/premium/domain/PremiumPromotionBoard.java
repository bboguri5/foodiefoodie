package com.project.foodiefoodie.premium.domain;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PremiumPromotionBoard {

    private Long promotionBno;
    private Long startDate;
    private Long endDate;
}
