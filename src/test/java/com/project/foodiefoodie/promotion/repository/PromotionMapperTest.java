package com.project.foodiefoodie.promotion.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PromotionMapperTest {

//    boolean reportCntModify(int reportCnt);
//    int checkReportCnt(String businessNo);


    @Autowired
    PromotionMapper mapper;

//    @Test
//    @DisplayName("해당 홍보글의 신고횟수가 1이되어야 한다.")
//    void reportCntModifyTest() {
//        String businessNo = "1111-1111-2222-2222";
//        boolean flag = mapper.reportCntModify(3, businessNo);
//        assertTrue(flag);
//    }



//    @Test
//    @DisplayName("해당 홍보글의 신고횟수가 반환되어야 한다.")
//    void checkReportCntTest() {
//        String businessNo = "1111-1111-2222-2222";
//        int cnt = mapper.checkReportCnt(businessNo);
//        System.out.println(cnt);
//    }
}