package com.project.foodiefoodie.reply.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
    private long reviewBno;
    private long replyNo;
    private String email;
    private String content;
    private String nickName;
    private Date lastUpdated;
}
