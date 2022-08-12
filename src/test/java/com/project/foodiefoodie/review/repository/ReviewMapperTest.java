package com.project.foodiefoodie.review.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewMapperTest {

    @Autowired
    ReviewMapper mapper;

    @Test
    @DisplayName("신고횟수를 가져와야 한다.")
    void checkTest() {
        int i = mapper.checkReportCnt("bbbb2222@naver.com");
        System.out.println(i);
    }

    @Test
    @DisplayName("신고 횟수가 2가 되어야 한다.")
    void modifyTest() {
        boolean flag = mapper.reportCntModify(2, "bbbb2222@naver.com");
        assertTrue(flag);
    }
}