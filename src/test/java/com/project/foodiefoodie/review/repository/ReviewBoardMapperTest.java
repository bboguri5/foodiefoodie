package com.project.foodiefoodie.review.repository;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class ReviewBoardMapperTest {

    @Autowired
    ReviewBoardMapper mapper;

    @Test
    @DisplayName("리뷰 정보를 저장해야 한다.")
    void saveTest(){
        ReviewBoard rb = new ReviewBoard();
        rb.setEmail("abc1234@naver.com");
        rb.setTitle("Title God Damn");
        rb.setContent("Nae Yong");
        rb.setBusinessNo("1234-2222-3333-1111");
        rb.setStarRate(4);

        boolean flag = mapper.save(rb);
        assertTrue(flag);
    }
    
    @Test
    @DisplayName("리뷰 사진을 넣어야한다.")
    void reviewUploadTest() {
        for (int i = 1; i <= 120; i++) {
            for (int j = 1; j <= 3; j++) {
                Random rn = new Random();
                int k = rn.nextInt(88 - 5 + 5) + 5;
                mapper.reviewUpload(i, "img/download/food" + k + ".jpg", "img/download/food" + k + ".jpg");
            }
        }
    }
}