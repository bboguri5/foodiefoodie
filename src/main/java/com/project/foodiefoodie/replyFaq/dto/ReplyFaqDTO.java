package com.project.foodiefoodie.replyFaq.dto;

import com.project.foodiefoodie.reply.domain.Reply;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReplyFaqDTO {
    private long replyFaqNo;
    private long replyNo;
    private String writerEmail;
    private String replyFaqContent;
    private String faqComplete;
    private String replyWriterEmail;

    private long reviewBno;
    private String replyContent;
    private String nickName;
    private Date lastUpdate;
}
