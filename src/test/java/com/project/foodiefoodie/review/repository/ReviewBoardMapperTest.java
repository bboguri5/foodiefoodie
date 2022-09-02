package com.project.foodiefoodie.review.repository;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.dto.FileDataDTO;
import com.project.foodiefoodie.review.dto.ReviewNumDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
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


    @Test
    @DisplayName("리스트 ,나옴 ")
    void listReview(){
        long reNo = 1;
        List<FileDataDTO> fileDataDTOS = mapper.reviewDataList(reNo);
        System.out.println("\n======\n");
        for (FileDataDTO fileDataDTO : fileDataDTOS) {
            System.out.println(fileDataDTO);
        }
        System.out.println("\n======\n");
    }

    @Test
    @DisplayName("갯수 나옴")
    void CountReview(){
        String email = "soslimso@nate.com";
        int i = mapper.MyReviewCount(email);
        System.out.println("\n======\n");
        System.out.println(i);
        System.out.println("\n======\n");
    }

    @Test
    @DisplayName("리뷰 번호 리스트 나옴")
    void rebnoList(){
        String email = "soslimso@nate.com";
        List<ReviewNumDTO> reviewNumDTOS = mapper.reviewNumList(email);
        System.out.println("\n======\n");
        for (ReviewNumDTO reviewNumDTO : reviewNumDTOS) {
            System.out.println(reviewNumDTO);
        }
        System.out.println("\n======\n");
    }




}