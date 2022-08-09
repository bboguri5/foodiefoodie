package com.project.foodiefoodie.reply.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
    long reviewBno;
    long replyNo;
    String email;
    String content;
    String nickName;
    Date lastUpdate;
}
