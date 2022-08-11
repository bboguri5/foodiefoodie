package com.project.foodiefoodie.hotdeal.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.dto.DealPromotionMasterDTO;
import com.project.foodiefoodie.promotion.domain.PromotionBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotDealMapper {

    // 핫딜 추가 기능
    boolean save(HotDeal deal);

    // 핫딜 랜덤 6개 조회 기능
    List<DealPromotionMasterDTO> findRandHot();

    // 핫딜 상세 조회 기능
    HotDeal findOne(String businessNo);

    // 핫딜 삭제 기능
    boolean remove(String businessNo);

    // 핫딜 수정 기능
    boolean modify(HotDeal deal);

    List<HotDeal> findAll();

    List<DealPromotionMasterDTO> findAll(Page page);

    int getMyTotalCnt();
}
