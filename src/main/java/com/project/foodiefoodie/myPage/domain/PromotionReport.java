package com.project.foodiefoodie.myPage.domain;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PromotionReport {

    private int prFaqNo; // 신고 글 번호
    private int promotionBno ; // 프로모션 글 번호
    private String writerEmail ; // 신고 글 쓴사람 아이디
    private String content ; // 신고 내용
    private String faqComplete ;// 신고 승인 여부 불가 : F , 승인 T
    private String promotionWriterEmail ; // 프로모션 글 쓴 사람
    private String businessNo ; // 사업자 번호


}
