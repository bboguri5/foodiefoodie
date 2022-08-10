package com.project.foodiefoodie.promotion.service;

import com.project.foodiefoodie.promotion.domain.PromotionBoard;
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

    // 해당 소개글 정보 요청 중간 처리
    public PromotionReviewDTO findOneService(String businessNo) {
        PromotionReviewDTO one = mapper.findOne(businessNo);
        log.info("one promotion review dto returned in service - {}", one);
        return one;
    }

    // 모든 소개글 정보 요청 중간 처리
    public List<PromotionBoard> findAllService() {
        return mapper.findAll();
    }
}
