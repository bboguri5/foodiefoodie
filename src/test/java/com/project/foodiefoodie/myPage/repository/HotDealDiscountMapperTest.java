package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.dto.ModiHotDealPercentDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class HotDealDiscountMapperTest {


    @Autowired
    private HotDealDiscountMapper hotDealDiscountMapper;

    @Test
    @DisplayName("사업자 번호 주면 얘가 핫딜 하는지 안하는지 확인하는 메서드 ")
    void hotDealCountTest(){ // 성공
        String buNo = "1234-2222-3333-1124";
        int i = hotDealDiscountMapper.hotDealCount(buNo);
        System.out.println("\n==========\n");
        System.out.println(i);
        System.out.println("\n==========\n");

    }

    @Test
    @DisplayName("사업자 번호 , 퍼센트 있으면 넣어줌 ! ")
    void insertDisCount(){ // 성공
        String buNo = "1234-2222-3333-1124";
        int percent = 15;
        ModiHotDealPercentDTO modiHotDealPercentDTO = new ModiHotDealPercentDTO();
        modiHotDealPercentDTO.setBusinessNo(buNo);
        modiHotDealPercentDTO.setDiscountPrice(percent);
        boolean b = hotDealDiscountMapper.insertHotDealPercent(modiHotDealPercentDTO);
        assertTrue(b);
    }

    @Test
    @DisplayName(" 수정 하는 메서드 ")
    void  hotDealDiscountMoidTest(){ // 성공

        String buNo = "1234-2222-3333-1124";
        int percent = 30;
        ModiHotDealPercentDTO modiHotDealPercentDTO = new ModiHotDealPercentDTO();
        modiHotDealPercentDTO.setBusinessNo(buNo);
        modiHotDealPercentDTO.setDiscountPrice(percent);
        boolean b = hotDealDiscountMapper.hotDealDiscountMoid(modiHotDealPercentDTO);
        assertTrue(b);

    }

}