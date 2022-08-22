package com.project.foodiefoodie.reviewFaq.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewFaqDTO {
    private long reFaqNo;
    private long reviewBno;
    private String writerEmail;
    private String content;
    private String faqComplete;
    private String reviewWriterEmail;

    private String title;
}
