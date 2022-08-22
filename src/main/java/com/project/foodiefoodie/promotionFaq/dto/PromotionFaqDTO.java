package com.project.foodiefoodie.promotionFaq.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PromotionFaqDTO {
    private long prFaqNo;
    private long promotionBno;
    private String writerEmail;
    private String content;
    private String faqComplete;
    private String promotionWriterEmail;
    private String businessNo;

    private String title;
}
