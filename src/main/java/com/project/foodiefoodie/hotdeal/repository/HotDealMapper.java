package com.project.foodiefoodie.hotdeal.repository;

import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotDealMapper {

    // 핫딜 추가 기능
    boolean save(HotDeal deal);

    // 핫딜 상세 조회 기능
    HotDeal findOne(String businessNo);

    // 핫딜 삭제 기능
    boolean remove(String businessNo);

    // 핫딜 수정 기능
    boolean modify(HotDeal deal);

    List<HotDeal> findAll();

    int getMyTotalCnt();
}
