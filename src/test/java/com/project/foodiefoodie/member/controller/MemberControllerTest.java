package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.ModifyDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.annotation.AccessType;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberControllerTest {


    @Autowired
    private MemberController controller;

    @Test
    @DisplayName("수정이 잘 되는지 확인")
    void modifyMemberControllerTest() {
//        boolean modifyMember(ModifyDTO modifyDTO);

//        ModifyDTO modifyDTO = new ModifyDTO();
//        modifyDTO.setEmail("soslimso@nate.com");
//        modifyDTO.setNickName("개개개개");
//        modifyDTO.setPhoneNumber("01099175454");
//        modifyDTO.setAddress("서울시 중구 한남동 더 힐스테잍트 123");


    }

}