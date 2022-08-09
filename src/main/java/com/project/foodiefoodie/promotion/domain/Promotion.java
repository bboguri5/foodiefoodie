package com.project.foodiefoodie.promotion.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
    private String businessNo;
    private long promotionBno;
    private Date lastUpdated;
    private String title;
}
