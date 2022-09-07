package com.project.foodiefoodie.review.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBoardDTO {
    private long reviewBno;
    private String email;
    private String title;
    private String content;
    private Date lastUpdated;
    private long likeCnt;
    private int starRate;
    private String storeName;
    private String storeAddress;
    private String storeDetailAddress;
    private String storeExtraAddress;
    private String businessNo;
    // private String filePath;
    // private int replyCount;
}