package com.project.foodiefoodie.review.domain;

import lombok.*;

import java.util.Date;


@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    String email;
    String title;
    String content;
    long reviewBno;
    String businessNo;
    Date lastUpdated;
    long likeCnt;
    int starRate;
    String isPrivate;
}
