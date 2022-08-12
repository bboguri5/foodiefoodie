package com.project.foodiefoodie.promotionFaq.repository;

import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PromotionFaqMapperTest {

    @Autowired
    PromotionFaqMapper mapper;

    @Test
    @DisplayName("홍보글 신고 리스트를 불러와야 한다.")
    void findAllTest() {
        List<PromotionFaq> promotionFaqList = mapper.findAll("F");
        for (PromotionFaq p : promotionFaqList) {
            System.out.println(p);
        }
    }

    @Test
    @DisplayName("해당 홍보글 신고 객체를 불러와야 한다.")
    void findOneTest() {
        PromotionFaq one = mapper.findOne(1);
        System.out.println(one);
    }

    @Test
    @DisplayName("해당 신고글의 내역이 T로 변경되어야 한다.")
    void updateTest() {
        boolean flag = mapper.update(22, "T");
        assertTrue(flag);
    }

}