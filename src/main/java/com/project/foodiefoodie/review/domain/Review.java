package com.project.foodiefoodie.review.domain;

import lombok.*;

import java.util.Date;


@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private String email;
    private String title;
    private String content;
    private long reviewBno;
    private String businessNo;
    private Date lastUpdated;
    private long likeCnt;
    private int starRate;
    private String isPrivate;
}
