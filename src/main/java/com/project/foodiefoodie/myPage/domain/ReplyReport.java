package com.project.foodiefoodie.myPage.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReplyReport {

    private int  replyFaqNo; //댓글 신고 번호
    private int  replyNo ; // 댓글 번호
    private String writerEmail ; // 신고 한 사람 이메일 // 아이디
    private String replyFaqContent; // 신고 내용
    private String faqComplete ; // 신고 처리 여부
    private String replyWriterEmail; // 댓글 글 작성자


}
