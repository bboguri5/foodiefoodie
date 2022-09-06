package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.dto.BusinessNoAndPromotionNoDTO;
import com.project.foodiefoodie.member.dto.MasterHotDealOnOffDTO;
import com.project.foodiefoodie.member.dto.MasterModifyDTO;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MasterMapperTest {

    @Autowired
    MasterMapper masterMapper;

    @Test
    @DisplayName("이메일 주면 마스터 불러와 ~ ")
    void callMaster(){ // 마스터에

        String email = "soslimso@nate.com";
        List<Master> masters = masterMapper.callMaster(email);
        //
        System.out.println("\n\n======================\n\n");
        // 마스터가 한명도 없으면 빈배열로옴
        System.out.println(masters);
            System.out.println(masters.size());
            // 마스터의 갯수가 없어도 . 나오긴하고 , 소환은됨 ,
        for (Master master : masters) {
            System.out.println(master);
        }
        System.out.println("\n\n======================\n\n");
    }

    @Test
    @DisplayName("이메일 주면 마스터 숫자 나와")
    void masterCountTest(){
        String email = "soslimso@nate.com";
        int i = masterMapper.masterCount(email);
        System.out.println("\n\n======================\n\n");
        System.out.println(i);
        System.out.println("\n\n======================\n\n");
    }

    @Test
    @DisplayName("비즈니스 번호 주면 마스터 수정을 함 !")
    void masterModiTest(){ // 성공 !!
        String email = "soslimso@nate.com";
        List<Master> masters = masterMapper.callMaster(email);
        Master master = masters.get(0);
        String businessNo = master.getBusinessNo();
        System.out.println("\n\n======================\n\n");
        System.out.println(master);
        System.out.println("\n\n======================\n\n");
        MasterModifyDTO masterModifyDTO = new MasterModifyDTO();
        masterModifyDTO.setBusinessNo(businessNo);
        masterModifyDTO.setStoreName("국물닭발 1240");
        masterModifyDTO.setStoreCallNumber("010-9847-1551");
        masterModifyDTO.setStoreAddress("ㅠ슈슈 수정");
        masterModifyDTO.setStoreDetailAddress("이14124 있구나");
        System.out.println(masterModifyDTO);
        System.out.println("\n\n======================\n\n");
        boolean b = masterMapper.masterModi(masterModifyDTO);
        System.out.println(b);
        List<Master> masters1 = masterMapper.callMaster(email);
        Master master1 = masters1.get(0);
        System.out.println(master1);
        System.out.println("\n\n======================\n\n");
        assertTrue(b);

    }

    @Test
    @DisplayName("사업자 번호 넣으면 , 사업자가쓴 프로모션 번호가 나와야 함 ")
    void findProBnoTest(){ // 성공
        String buBno ="1234-2222-3333-1124";
        BusinessNoAndPromotionNoDTO promotionBno = masterMapper.findPromotionBno(buBno);
        System.out.println("\n\n======================\n\n");
        System.out.println(promotionBno);
        System.out.println("\n\n======================\n\n");

    }

    @Test
    @DisplayName("비즈니스번호 , 핫딜 on/off 넣으면 값이 바뀜")
    void  MasterHotDealOnOffTest(){
        String buBno = "1234-2222-3333-1124";
        String hotDeal = "off";
        MasterHotDealOnOffDTO masterHotDealOnOffDTO = new MasterHotDealOnOffDTO();
        masterHotDealOnOffDTO.setBusinessNo(buBno);
        masterHotDealOnOffDTO.setHotDeal(hotDeal);
        boolean b = masterMapper.MasterHotDealOnOff(masterHotDealOnOffDTO);
        assertTrue(b);
//
    }

    @Test
    @DisplayName("사업자번호 주면 사업자가 삭제됨 ")
    void deleteMasterTest(){ // 성공
        String busibno= "1111-2222-3333-0001 ";
        boolean b = masterMapper.deleteMaster(busibno);
        assertTrue(b);
    }

    @Test
    @DisplayName("비즈니스 번호 주면 이메일 받아냄")
    void findEmailTest(){
        String busiNo= "1234-2222-3333-1129";
        String email = masterMapper.findEmail(busiNo);
        System.out.println("\n\n====\n\n");
        System.out.println(email);
        System.out.println("\n\n====\n\n");
    }


}