package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.dto.ReplyReportDTO;
import com.project.foodiefoodie.myPage.dto.ReviewReportDTO;
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



}