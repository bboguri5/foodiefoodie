package com.project.foodiefoodie.myPage.repository;


import com.project.foodiefoodie.myPage.dto.ModiHotDealPercentDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotDealDiscountMapper{

    // 이사람이 핫딜을 하고있는지 안하고있는지 메서드 1이면 하는거 0 이면 안하는거
    int hotDealCount(String businessNo);

    // 핫딜 가격 지정하기
    boolean insertHotDealPercent(ModiHotDealPercentDTO modiHotDealPercentDTO);


    // 수정하는 메서드
    boolean hotDealDiscountMoid(ModiHotDealPercentDTO modiHotDealPercentDTO);


}
