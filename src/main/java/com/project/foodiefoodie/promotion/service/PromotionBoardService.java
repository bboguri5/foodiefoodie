package com.project.foodiefoodie.promotion.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.promotion.domain.PromotionBoard;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import com.project.foodiefoodie.promotion.repository.PromotionBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class PromotionBoardService {

    private final PromotionBoardMapper mapper;

    public List<PromotionMasterDTO> topAvgRateCountService() {
        return mapper.topAvgRateCount();
    }

    // 해당 소개글 정보 요청 중간 처리
    public PromotionReviewDTO findOneService(String businessNo) {
        PromotionReviewDTO one = mapper.findOne(businessNo);
        return one;
    }

    // 모든 소개글 정보 요청 중간 처리
    public Map<String, Object> findAllService(Page page) {
        List<PromotionMasterDTO> DBList = mapper.findAll(page);
        int totalCnt = mapper.getMyTotalCnt();
        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
    }
}
