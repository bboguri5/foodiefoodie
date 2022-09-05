package com.project.foodiefoodie.myPage.dto;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReplyReportDTO2 {


    private int  replyFaqNo; //댓글 신고 번호
    private int  replyNo ; // 댓글 번호
    private String replyContent ; // 댓글 내용
    private String replyFaqContent; // 신고 내용

}
