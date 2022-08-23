package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewBoardServiceTest {

    @Autowired ReviewBoardService service;

    @Test
    @DisplayName("리뷰 정보를 저장하고, 프로모션 테이블 업데이트 한다.")
    void saveTest(){
        for (int j = 0; j < 10; j++) {
            for (int i = 1; i < 10; i++) {
                ReviewBoard rb = new ReviewBoard();
                rb.setEmail("bbbb2222@naver.com");
                rb.setTitle("제목입니다~ " + i);
                rb.setContent("내용입니다~ " + i);
                rb.setBusinessNo("1234-2222-3333-111" + i);
                Random rn = new Random();
                rb.setStarRate(rn.nextInt(5 - 1 + 1) + 1);

                service.saveService(rb);
            }
        }
    }

    @Test
    @DisplayName("리뷰 정보를 저장하고, 프로모션 테이블 업데이트 한다.")
    void saveTest2(){
        for (int j = 0; j < 10; j++) {
            for (int i = 0; i < 4; i++) {
                ReviewBoard rb = new ReviewBoard();
                rb.setEmail("bbbb2222@naver.com");
                rb.setTitle("제목입니다~ " + i);
                rb.setContent("내용입니다~ " + i);
                rb.setBusinessNo("1234-2222-3333-112" + i);
                Random rn = new Random();
                rb.setStarRate(rn.nextInt(5 - 1 + 1) + 1);

                service.saveService(rb);
            }
        }
    }

    @Test
    void insertTest() {
        ReviewBoard rb = new ReviewBoard();
        rb.setEmail("hwseo98@naver.com");
        rb.setTitle("새로운 타이틀이야");
        rb.setContent("내용이 겁나 길면 어케 되는거야!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!!!!!!!!!! 먀ㅐㅇ러내ㅑㅇ럼냐ㅐ러ㅑㅐㄴㄷ멀ㄴ댜ㅐㅓ랴ㅐㅁㄴ더랴ㅐㄴ더랴ㅐㄴ더래ㅑㅁ너래ㅑㄴ더랴ㅐㅁㄴ더랴ㅐㅁㄴ더래ㅓ" +
                        "멍랴ㅐㅁ너랴ㅐㄴㄷ머랴ㅐㄴㅁ덜먀ㅐ더랴ㅐㄴ더랴ㅐㄷ너랴ㅐㄴ덜먀 만 ㅑ맨러내ㅑ더랴ㅐㅁㄴㄷ러ㅐㅁㄴㄷㄹ" +
                        "ㄴ러냐ㅐ런댜ㅐ럼ㄴ댜ㅐ럳먀ㅐ럼ㄴ댜ㅐ러ㅑㅐㄷㄴ러ㅑㅐㄴㄷ멀ㄴ댜ㅐ럳냐ㅐ러ㅑㅐ멀댜ㅐㅓ랴매널먀ㅐㄷ너래 더ㅑ 너무 맛나" +
                        "ㅁ랴ㅓㅁㄴ댜대러먀ㅐㅓ캬ㅐㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ" +
                        "아주 ggggggggggggggggggggggggggggggggggggggggggggggggggasdfsdfsfkajwehfiushefiuhseiufiullllllllllllllllsfhsfjhwefhweiafasefwefewfwe" +
                "재멍래ㅑㅈ더래ㅓ랮더랴ㅐ젇랴ㅐㅓ대ㅑㅁ렂대ㅑㅓㅐㅑ러");
        rb.setBusinessNo("1234-2222-3333-1113" + 5);
        rb.setStarRate(5);

        service.saveService(rb);
    }
}