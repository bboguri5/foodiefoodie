package com.project.foodiefoodie.promotion.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.search.Search;
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

    // 해당 소개글 정보 요청 중간 처리
    public PromotionReviewDTO findOneService(String businessNo) {
        PromotionReviewDTO one = mapper.findOne(businessNo);
        return one;
    }

    public boolean reportCntModifyService(int reportCnt, String businessNo) {
        return mapper.reportCntModify(reportCnt, businessNo);
    }

    public int checkReportCnt(String businessNo) {
        return mapper.checkReportCnt(businessNo);
    }


    // 프로모션 갯수 불러오는 메서드
    public int countPromotionBoardService(String businessNo){
        return mapper.countPromotionBoard(businessNo);
    }

    // 프로모션 번호 알려주는 메서드
    public Integer findProBoardNumService(String businessNo){
        return mapper.findProBoardNum(businessNo);
    }
}
