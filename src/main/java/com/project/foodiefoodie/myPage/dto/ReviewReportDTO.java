package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewReportDTO {

    private int reFaqNo; // 리뷰 신고글 번호
    private int reviewBno ; // 리뷰 글 번호
    private String writerEmail ; // 신고 한 사람 이메일 // 아이디
    private String content; // 신고 내용
//    private String reviewWriterEmail; // 신고 당한사람
}
