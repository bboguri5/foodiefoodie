package com.project.foodiefoodie.myPage.service;


import com.project.foodiefoodie.myPage.dto.ModiHotDealPercentDTO;
import com.project.foodiefoodie.myPage.repository.HotDealDiscountMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class HotDealDiscountService {


    private final HotDealDiscountMapper hotDealDiscountMapper;


    // 있는지 없는지 확인
    public int hotDealCountService(String businessNo){
        int i = hotDealDiscountMapper.hotDealCount(businessNo);
        return i;
    }

    //  핫딜 테이블에 삽입
    public boolean insertHotDealService(ModiHotDealPercentDTO modiHotDealPercentDTO){
        boolean b = hotDealDiscountMapper.insertHotDealPercent(modiHotDealPercentDTO);
        return b;
    }


    // 핫딜 수정 !
    public boolean hotDealModiService(ModiHotDealPercentDTO modiHotDealPercentDTO){
        boolean c = hotDealDiscountMapper.hotDealDiscountMoid(modiHotDealPercentDTO);
        return c;
    }


}
