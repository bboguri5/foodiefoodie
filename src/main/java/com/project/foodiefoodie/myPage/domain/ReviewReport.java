package com.project.foodiefoodie.myPage.domain;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewReport {


    private int reFaqNo; // 리뷰 신고글 번호
    private int reviewBno ; // 리뷰 글 번호
    private String writerEmail ; // 신고 한 사람 이메일 // 아이디
    private String content; // 신고 내용
    private String  faqComplete ; // 신고 처리 여부
    private String reviewWriterEmail; // 리뷰 글 작성자
}
