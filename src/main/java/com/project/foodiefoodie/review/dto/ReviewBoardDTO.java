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

    // private String filePath;
    // private int replyCount;
}