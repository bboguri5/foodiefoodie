package com.project.foodiefoodie.premiume.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Premiume {
    long promotionBno;
    int startDate;
    int endDate;
}
