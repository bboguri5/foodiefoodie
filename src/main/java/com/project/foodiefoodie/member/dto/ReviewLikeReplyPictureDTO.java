package com.project.foodiefoodie.member.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewLikeReplyPictureDTO {

    private long reviewBno;
    private String fileData;
    private int LikeCnt;
    private int replyCount;


}
