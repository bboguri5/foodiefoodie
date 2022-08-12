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
        int totalCnt = mapper.getTotal();
        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
    }

    public Map<String, Object> findAllSearchService(Search search) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<PromotionMasterDTO> searchList = mapper.findAllSearch(search);
        log.info("{}", searchList);

        // 목록 중간 데이터 처리
//        processConverting(searchList);

        findDataMap.put("bList", searchList);
        findDataMap.put("tc", mapper.getTotalCount(search));

        return findDataMap;    }

    public int findHashTagCountService(String hashTag) {
        return mapper.findHashTagCount(hashTag);
    }

    public Map<String, Object>  findHashTagService(String tag, Page page) {

        Map<String, Object> findDataMap = new HashMap<>();

        List<PromotionMasterDTO> hashTagList = mapper.findHashTag(tag, page);
        findDataMap.put("bList", hashTagList);
        findDataMap.put("tc", mapper.getMyTotalCnt(tag));
        return findDataMap;
    }

    public boolean reportCntModifyService(int reportCnt, String businessNo) {
        return mapper.reportCntModify(reportCnt, businessNo);
    }

    public int checkReportCnt(String businessNo) {
        return mapper.checkReportCnt(businessNo);
    }
}
