package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.dto.BusinessNoAndPromotionNoDTO;
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
        System.out.println("\n\n======================\n\n");
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

}