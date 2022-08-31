package com.project.foodiefoodie.review.domain;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoard {

    private String email;
    private String title;
    private String content;
    private Long reviewBno;
    private String businessNo;
    private Date lastUpdate;
    private Long likeCnt;
    private int starRate;
    private char isPrivate;
    private int reportCnt;
    private String storeName;
    private String storeAddress;
    private String storeDetailAddress;
    private String storeExtraAddress;
}
