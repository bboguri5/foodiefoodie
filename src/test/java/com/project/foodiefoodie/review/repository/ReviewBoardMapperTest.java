package com.project.foodiefoodie.review.repository;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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

//    @Test
//    @DisplayName("리뷰 정보를 저장해야 한다.")
//    void saveTest() {
//        for (int j = 0; j < 10; j++) {
//            for (int i = 1; i < 10; i++) {
//                ReviewBoard rb = new ReviewBoard();
//                rb.setEmail("bbbb2222@naver.com");
//                rb.setTitle("제목입니다~ " + i);
//                rb.setContent("내용입니다~ " + i);
//                rb.setBusinessNo("1234-2222-3333-111"+i);
//                Random rn = new Random();
//                rb.setStarRate(rn.nextInt(5 - 1 + 1) + 1);
//                mapper.save(rb);
//            }
//        }
//    }
}