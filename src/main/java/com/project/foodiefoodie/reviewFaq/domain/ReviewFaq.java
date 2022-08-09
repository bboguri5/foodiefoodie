package com.project.foodiefoodie.reviewFaq.domain;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ReviewFaq {
    private long reFaqNo;
    private long reviewBno;
    private String writerEmail;
    private String content;
    private String faqComplete;
}
