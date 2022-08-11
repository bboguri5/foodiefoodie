package com.project.foodiefoodie.promotion.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.promotion.domain.PromotionBoard;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PromotionBoardMapper {

    // 가게 소개글을 저장하는 기능
    boolean save(PromotionBoard promotionBoard);

    // 해당 가게 탑 리뷰 게시물 별점 총점과 리뷰 개수 가져오기
    List<PromotionReviewDTO> topAvgRateCount();

    // 해당 가게 리뷰 별점 총점, 리뷰 개수 업데이트 기능
    boolean updateRateAndCount(String businessNo, double avgStarRate, Long reviewCnt);
    
    // 해당 가게 리뷰 별점, 리뷰 개수 가져오기
    PromotionReviewDTO findOne(String businessNo);

    List<PromotionBoard> findAll(Page page);

    Long getMyTotalCnt();
}

