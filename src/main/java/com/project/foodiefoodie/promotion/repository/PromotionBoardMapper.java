package com.project.foodiefoodie.promotion.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.search.Search;
import com.project.foodiefoodie.promotion.domain.PromotionBoard;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PromotionBoardMapper {

    // 가게 소개글을 저장하는 기능
    boolean save(PromotionBoard promotionBoard);

    // 해당 가게 리뷰 별점 총점, 리뷰 개수 업데이트 기능
    boolean updateRateAndCount(String businessNo, double avgStarRate, Long reviewCnt);
    
    // 해당 가게 리뷰 별점, 리뷰 개수 가져오기
    PromotionReviewDTO findOne(String businessNo);

    List<PromotionMasterDTO> findAll(Page page);

    int getMyTotalCnt(String hashTag);

    int getTotal();

    List<PromotionMasterDTO> findAllSearch(Search search);

    int getTotalCount(Search search);

    List<PromotionMasterDTO> findHashTag(@Param("hashTag") String hashTag, @Param("page") Page page);

    int findHashTagCount(String hashTag);

    boolean reportCntModify(int reportCnt, String businessNo);
    int checkReportCnt(String businessNo);


    // 프로모션 보드 갯수 확인하는 메서드
    int countPromotionBoard(String businessNo);

    // 프로모션 번호 가져옴
//    int findProBoardNum(String businessNo);

    Integer findProBoardNum(String businessNo);

}

