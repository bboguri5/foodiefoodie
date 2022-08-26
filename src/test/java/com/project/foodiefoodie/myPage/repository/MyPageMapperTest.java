package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.dto.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MyPageMapperTest {


    @Autowired
    MyPageMapper myPageMapper;

    @Test
    @DisplayName("이메일을 넣으면 내 리뷰 글에대해 신고한 리스트가 나온다 !")
    void findReviewReportList(){
        String email = "soslimso@nate.com";
        List<ReviewReportDTO> reviewReportDTOS = myPageMapper.reviewReportDTOList(email);
        System.out.println("\n\n\n ============================\n\n\n");
        for (ReviewReportDTO reviewReportDTO : reviewReportDTOS) {
            System.out.println(reviewReportDTO);
        }
        System.out.println("\n\n\n ============================\n\n\n");
    }


    @Test
    @DisplayName("이메일을 넣으면 내 댓글에 대해 신고한 리스트가 나온다 !")
    void findReplyReportList(){
        String email = "soslimso@nate.com";
        List<ReplyReportDTO> replyReportDTOS = myPageMapper.replyReportDTOList(email);
        System.out.println("\n\n\n ============================\n\n\n");
        for (ReplyReportDTO replyReportDTO : replyReportDTOS) {
            System.out.println(replyReportDTO);
        }
        System.out.println("\n\n\n ============================\n\n\n");

    }

    @Test
    @DisplayName("이메일 넣으면 내용 잘 나오는지 보자구 ")
    void reviewFaqList(){
        String email = "soslimso@nate.com";
        List<ReviewReportDTO2> reviewReportDTO2s = myPageMapper.reviewReportDTO2List(email);
        System.out.println("\n\n\n ============================\n\n\n");
        for (ReviewReportDTO2 reviewReportDTO2 : reviewReportDTO2s) {
            System.out.println(reviewReportDTO2);
        }
        System.out.println("\n\n\n ============================\n\n\n");
    }
    @Test
    @DisplayName("이메일 넣으면 내용 잘 나오는지 보자구 ")
    void replyFaqList(){
        String email = "soslimso@nate.com";
        List<ReplyReportDTO2> replyReportDTO2s = myPageMapper.replyReportDTO2List(email);
        System.out.println("\n\n\n ============================\n\n\n");
        for (ReplyReportDTO2 replyReportDTO2 : replyReportDTO2s) {
            System.out.println(replyReportDTO2);
        }
        System.out.println("\n\n\n ============================\n\n\n");
    }
    
    @Test
    @DisplayName("이메일 넣으면 내 프로모션 신고 내역 나옴 ")
    void promotionReportListTest(){
        String email = "soslimso@nate.com";
        String businessNo = "1234-2222-3333-1125";
        PromotionInputDTO promotionInputDTO = new PromotionInputDTO();
        promotionInputDTO.setEmail(email);
        promotionInputDTO.setBusinessNo(businessNo);
        List<PromotionReportDTO> promotionReportDTOS = myPageMapper.promotionReportList(promotionInputDTO);
        System.out.println("\n\n\n ============================\n\n\n");
        for (PromotionReportDTO promotionReportDTO : promotionReportDTOS) {
            System.out.println(promotionReportDTO);
        }
        System.out.println("\n\n\n ============================\n\n\n");
        


    }
}