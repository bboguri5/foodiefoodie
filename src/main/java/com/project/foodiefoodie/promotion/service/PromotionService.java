package com.project.foodiefoodie.promotion.service;

import com.project.foodiefoodie.promotion.repository.PromotionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class PromotionService {

//    boolean reportCntModify(int reportCnt, String businessNo);
//    int checkReportCnt(String businessNo);


    private final PromotionMapper mapper;

    public boolean reportCntModifyService(int reportCnt, String businessNo) {
        return mapper.reportCntModify(reportCnt, businessNo);
    }

    public int checkReportCnt(String businessNo) {
        return mapper.checkReportCnt(businessNo);
    }

}
