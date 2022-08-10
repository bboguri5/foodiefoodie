package com.project.foodiefoodie.promotion.service;

import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import com.project.foodiefoodie.promotion.repository.PromotionBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PromotionBoardService {

    private final PromotionBoardMapper mapper;

    public List<PromotionReviewDTO> topAvgRateCountService() {
        return mapper.topAvgRateCount();
    }
}
