package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PromotionReportDTO {


    private int prFaqNo; // 신고 글 번호
    private int promotionBno; // 프로모션 글 번호
    private String StoreName; // 가게 이름
    private String title; // 프로모션 글 제목
    private String content; // 신고 내용

}
