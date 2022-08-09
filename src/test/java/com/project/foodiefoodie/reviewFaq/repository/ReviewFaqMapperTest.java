package com.project.foodiefoodie.reviewFaq.repository;

import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewFaqMapperTest {

    @Autowired
    ReviewFaqMapper mapper;

    @Test
    @DisplayName("리뷰 신고 리스트를 불러와야 한다.")
    void findAllTest() {
        List<ReviewFaq> all = mapper.findAll();
        for (ReviewFaq reviewFaq : all) {
            System.out.println(reviewFaq);
        }
    }

    @Test
    @DisplayName("해당 리뷰 신고 객체를 불러와야 한다.")
    void findOneTest() {
        ReviewFaq one = mapper.findOne(1);
        System.out.println(one);

    }
}