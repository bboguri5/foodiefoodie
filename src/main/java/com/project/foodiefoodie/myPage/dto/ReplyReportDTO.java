package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReplyReportDTO {


    private int  replyFaqNo; //댓글 신고 번호
    private int  replyNo ; // 댓글 번호
    private String writerEmail ; // 신고 한 사람 이메일 // 아이디
    private String replyFaqContent; // 신고 내용

}
