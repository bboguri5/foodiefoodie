package com.project.foodiefoodie.review.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

    boolean reportCntModify(int reportCnt, String email);

    int checkReportCnt(String email);


    // 리뷰번호 주면 , 리뷰 좋아요 갯수 줌
    int reviewLikeCount(Long reviewBno);



}
