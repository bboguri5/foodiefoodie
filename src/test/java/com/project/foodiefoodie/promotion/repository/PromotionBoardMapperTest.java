package com.project.foodiefoodie.promotion.repository;

import com.project.foodiefoodie.promotion.domain.PromotionBoard;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class PromotionBoardMapperTest {

    @Autowired
    PromotionBoardMapper mapper;


    @Test
    @DisplayName("가게 게시물을 저장해야 한다.")
    void saveTest() {
        PromotionBoard pb = new PromotionBoard();
        pb.setBusinessNo("1234-2222-3333-1117");
        pb.setContent("내용입니다.");
        pb.setTitle("제목입니다.");

        boolean flag = mapper.save(pb);
        assertTrue(flag);
    }

    @Test
    @DisplayName("가게 게시물을 저장해야 한다.")
    void topAvgCountTest() {

//        List<PromotionReviewDTO> list = mapper.topAvgRateCount();
//        System.out.println(list);
    }

    @Test
    @DisplayName("가게 게시물 하나를 조회해야 한다.")
    void findOneTest() {

        PromotionReviewDTO list = mapper.findOne("1234-2222-3333-1116");
        System.out.println(list);
    }

    @Test
    @DisplayName("가게 게시물 모두를 조회해야 한다.")
    void findAllTest() {

//        List<PromotionBoard> list = mapper.findAll();
//        System.out.println(list);
    }
}