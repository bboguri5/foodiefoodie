package com.project.foodiefoodie.promotionFaq.domain;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class PromotionFaq {
    private long prFaqNo;
    private long promotionBno;
    private String writerEmail;
    private String content;
    private String faqComplete;
    private String promotionWriterEmail;
    private String businessNo;
}
