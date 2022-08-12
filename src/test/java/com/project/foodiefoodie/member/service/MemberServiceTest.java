package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.dto.ModifyDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberServiceTest {

    @Autowired
    private MemberService service;


    @Test
    @DisplayName("잘 바뀌어야 한다 ")
    void  modifyMemberServiceTest(){
        ModifyDTO modifyDTO = new ModifyDTO();
        modifyDTO.setEmail("soslimso@nate.com");
        modifyDTO.setNickName("찌찌개개");
        modifyDTO.setPhoneNumber("01184775454");
        modifyDTO.setAddress("서울시 강남구 강남동 더 강남잍트 1233");
        boolean b = service.modifyMemberService(modifyDTO);
        assertTrue(b);

    }

    @Test
    @DisplayName("들어간 비밀번호와 , DB 비밀번호가 같으면 true ")// 테스트 성공
    void findPasswordService(){

//        boolean passwordService = service.findPasswordService("soslimso@nate.com", "123123!@#"); // 맞는경우
        boolean passwordService = service.findPasswordService("soslimso@nate.com", "123123!@#!"); // 틀린경우
        assertTrue(passwordService);
    }

}