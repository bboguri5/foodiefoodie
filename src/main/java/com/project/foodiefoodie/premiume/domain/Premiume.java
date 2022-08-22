package com.project.foodiefoodie.premiume.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Premiume {
    private long promotionBno;
    private int startDate;
    private int endDate;
    private String complete;
}
