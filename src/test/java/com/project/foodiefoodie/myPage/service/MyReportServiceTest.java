package com.project.foodiefoodie.myPage.service;

import com.project.foodiefoodie.myPage.dto.ReplyReportDTO;
import com.project.foodiefoodie.myPage.dto.ReplyReportDTO2;
import com.project.foodiefoodie.myPage.dto.ReviewReportDTO;
import com.project.foodiefoodie.myPage.dto.ReviewReportDTO2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class MyReportServiceTest {


    @Autowired
    MyReportService reportService;




    // 신규
    @Test
    @DisplayName("리뷰 신고 리스트가 줄여서 나옴")
    void shortIdAndContentReviewServiceTest2(){ // 성공
        String email = "aaa@nate.com";
        System.out.println("\n\n\n==================================\n\n\n");
        List<ReviewReportDTO2> reviewReportDTO2s = reportService.reviewReportDTOListService2(email);
        for (ReviewReportDTO2 reviewReportDTO2 : reviewReportDTO2s) {
            System.out.println(reviewReportDTO2.getReFaqNo());
            System.out.println(reviewReportDTO2.getReviewBno());
            System.out.println(reviewReportDTO2.getReviewTitle());
            System.out.println(reviewReportDTO2.getReviewFaqContent());
            System.out.println(reviewReportDTO2.getRealReviewContent());
        }
        System.out.println("\n\n\n==================================\n\n\n");
    }
    @Test
    @DisplayName("댓글 신고 리스트가 줄여서 나옴")
    void shortIdAndContentReplyServiceTest2(){ // 성공
        String email = "aaa@nate.com";
        System.out.println("\n\n\n==================================\n\n\n");
        List<ReplyReportDTO2> replyReportDTO2s = reportService.replyReportDTOListService2(email);
        for (ReplyReportDTO2 replyReportDTO2 : replyReportDTO2s) {
            System.out.println(replyReportDTO2);
        }
        System.out.println("\n\n\n==================================\n\n\n");
    }



}