package com.project.foodiefoodie.hotdeal.repository;

import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class HotDealMapperTest {

    @Autowired
    HotDealMapper mapper;

    @Test
    @DisplayName("핫딜 테이블에 핫딜 정보를 저장해야 한다.")
    void saveTest() throws ParseException {

        HotDeal deal = new HotDeal("1234-2222-3333-1117", 9000, 20220801L, 20220819L);

        boolean flag = mapper.save(deal);
        assertTrue(flag);
    }

    @Test
    @DisplayName("핫딜 테이블에 핫딜 정보를 모두 불러와야 한다.")
    void findAllTest() {

        List<HotDeal> list = mapper.findAll();
        System.out.println(list);
    }

    @Test
    @DisplayName("핫딜 테이블에 특정 핫딜 정보를 불러와야 한다.")
    void findOneTest() {

        HotDeal deal = mapper.findOne("1234-2222-3333-1112");
        System.out.println(deal);
    }

    @Test
    @DisplayName("특정 핫딜 정보를 수정해야 한다.")
    void modifyTest() throws ParseException {

        String businessNo = "1234-2222-3333-1111";

        HotDeal deal = new HotDeal();
        deal.setBusinessNo(businessNo);
        deal.setDiscountPrice(1000);
        deal.setStartDate(20220801L);
        deal.setEndDate(20220820L);

        mapper.modify(deal);

        HotDeal one = mapper.findOne(businessNo);
        
        assertEquals(1000, one.getDiscountPrice());

    }

    @Test
    @DisplayName("특정 핫딜 정보를 삭제해야 한다.")
    void removeTest() {

        String businessNo = "1234-2222-3333-1112";
        boolean flag = mapper.remove(businessNo);
        assertTrue(flag);

    }

}