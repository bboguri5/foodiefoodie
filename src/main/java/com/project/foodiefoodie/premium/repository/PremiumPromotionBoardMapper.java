package com.project.foodiefoodie.premium.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.premium.dto.PremiumPromotionBoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PremiumPromotionBoardMapper {

    // 메인 페이지에 보여줄 7개의 랜덤 가게 불러오기
    List<PremiumPromotionBoardDTO> findSevenRand();

    // 프리미엄 가게 모두 조회
    List<PremiumPromotionBoardDTO> findAll(Page page);

    int getMyTotalCnt();
}
