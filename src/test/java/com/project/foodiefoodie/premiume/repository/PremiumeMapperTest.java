package com.project.foodiefoodie.premiume.repository;

import com.project.foodiefoodie.premiume.domain.Premiume;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PremiumeMapperTest {

    @Autowired
    PremiumeMapper mapper;

    @Test
    @DisplayName("해당 객체가 저장되어야 한다.")
    void saveTest() {
        Premiume p = new Premiume();
        p.setPromotionBno(2);
        p.setStartDate(20220101);
        p.setEndDate(20221023);
        boolean flag = mapper.save(p);
    }

//    @Test
//    @DisplayName("월정액 리스트가 출력되어야 한다.")
//    void findAllTest() {
//        List<Premiume> premiumeList = mapper.findAll();
//        for (Premiume p : premiumeList) {
//            System.out.println(p);
//        }
//    }

    @Test
    @DisplayName("해당 객체가 수정되어야 한다.")
    void modifyTest() {
        Premiume p = new Premiume();
        p.setPromotionBno(2);
        p.setStartDate(20220303);
        p.setEndDate(22220101);
        boolean flag = mapper.modify(p);
        assertTrue(flag);
    }

    @Test
    @DisplayName("해당 객체가 삭제되어야 한다.")
    void removeTest() {
        boolean flag = mapper.remove(2);
        assertTrue(flag);
    }
}