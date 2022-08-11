package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewBoardServiceTest {

    @Autowired ReviewBoardService service;

    @Test
    @DisplayName("리뷰 정보를 저장하고, 프로모션 테이블 업데이트 한다.")
    void saveTest(){
        ReviewBoard rb = new ReviewBoard();
        rb.setEmail("abc1234@naver.com");
        rb.setTitle("Title God Damn");
        rb.setContent("Nae Yong");
        rb.setBusinessNo("1234-2222-3333-1117");
        rb.setStarRate(5);

        boolean flag = service.saveService(rb);
        assertTrue(flag);
    }
}