package com.project.foodiefoodie.review.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

    boolean reportCntModify(int reportCnt, String email);

    int checkReportCnt(String email);

}
