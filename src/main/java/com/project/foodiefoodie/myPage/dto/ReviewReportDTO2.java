package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewReportDTO2 {

    private int reFaqNo; // 리뷰 신고글 번호
    private int reviewBno ; // 리뷰 글 번호
    private String reviewTitle; // 리뷰 글 제목
    private String reviewFaqContent; // 신고 내용

}
