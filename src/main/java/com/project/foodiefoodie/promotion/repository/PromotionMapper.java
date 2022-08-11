package com.project.foodiefoodie.promotion.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PromotionMapper {

    boolean reportCntModify(int reportCnt, String businessNo);
    int checkReportCnt(String businessNo);
}
