package com.project.foodiefoodie.member.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewLikeReplyPictureDTO {

    private long reviewBno; // 리뷰 번호
    private String fileData; // 리뷰 사진데이터
    private int LikeCnt; // 좋아요 갯수
    private int replyCount; // 댓글 갯수


}
