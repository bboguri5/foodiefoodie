package com.project.foodiefoodie.replyFaq.domain;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ReplyFaq {
    private long replyFaqNo;
    private long replyNo;
    private String writerEmail;
    private String content;
    private String faqComplete;
}
