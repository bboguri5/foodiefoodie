package com.project.foodiefoodie.promotion.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
    String businessNo;
    long promotionBno;
    Date lastUpdated;
    String title;
}
