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


    @Test
    @DisplayName("리뷰글 신고 리스트가 줄여서 나옴")
    void shortIdAndContentReviewServiceTest(){ // 성공
        String email = "soslimso@nate.com";
        List<ReviewReportDTO> reviewReportDTOS = reportService.reviewReportDTOListService(email);
        System.out.println("\n\n\n==================================\n\n\n");
        for (ReviewReportDTO reviewReportDTO : reviewReportDTOS) {
            System.out.println(reviewReportDTO);
        }
        System.out.println("\n\n\n==================================\n\n\n");
    }
    @Test
    @DisplayName("댓글 신고 리스트가 줄여서 나옴")
    void shortIdAndContentReplyServiceTest(){ // 성공
        String email = "soslimso@nate.com";

        System.out.println("\n\n\n==================================\n\n\n");
        List<ReplyReportDTO> replyReportDTOS = reportService.replyReportDTOListService(email);
        for (ReplyReportDTO replyReportDTO : replyReportDTOS) {
            System.out.println(replyReportDTO);
        }
        System.out.println("\n\n\n==================================\n\n\n");
    }


    // 신규
    @Test
    @DisplayName("리뷰 신고 리스트가 줄여서 나옴")
    void shortIdAndContentReviewServiceTest2(){ // 성공
        String email = "soslimso@nate.com";
        System.out.println("\n\n\n==================================\n\n\n");
        List<ReviewReportDTO2> reviewReportDTO2s = reportService.reviewReportDTOListService2(email);
        for (ReviewReportDTO2 reviewReportDTO2 : reviewReportDTO2s) {
            System.out.println(reviewReportDTO2);
        }
        System.out.println("\n\n\n==================================\n\n\n");
    }
    @Test
    @DisplayName("댓글 신고 리스트가 줄여서 나옴")
    void shortIdAndContentReplyServiceTest2(){ // 성공
        String email = "soslimso@nate.com";
        System.out.println("\n\n\n==================================\n\n\n");
        List<ReplyReportDTO2> replyReportDTO2s = reportService.replyReportDTOListService2(email);
        for (ReplyReportDTO2 replyReportDTO2 : replyReportDTO2s) {
            System.out.println(replyReportDTO2);
        }
        System.out.println("\n\n\n==================================\n\n\n");
    }



}