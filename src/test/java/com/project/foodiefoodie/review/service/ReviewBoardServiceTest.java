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
        rb.setEmail("bbbb2222@naver.com");
        rb.setTitle("제목입니다~3");
        rb.setContent("내용입니다~3");
        rb.setBusinessNo("1234-2222-3333-1122");
        rb.setStarRate(4);

        boolean flag = service.saveService(rb);
        assertTrue(flag);
    }
}