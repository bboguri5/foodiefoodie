package com.project.foodiefoodie.review.repository;

import com.project.foodiefoodie.review.dto.AvgStarDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ReviewBoardMapperTest {

    @Autowired
    ReviewBoardMapper mapper;

    @Test
    @DisplayName("식당별 리뷰 평점을 가져와야 한다.")
    void avgStarRateTest() {
        List<AvgStarDTO> avgStars = mapper.avgStarRate();
        System.out.println(avgStars);
    }
}