package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Auth;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.dto.DeleteMemberDTO;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import com.project.foodiefoodie.member.dto.NewModifyMemberDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberMapperTest {

    @Autowired
    MemberMapper mapper;


    @Test
    @DisplayName("회원 한명이 정상적으로 등록되어야 한다.")
    void registerTest() {
        Member member = new Member();
        member.setAuth(Auth.ADMIN);
        member.setEmail("kdf556@naver.com");
        member.setBirth(19950930);
        member.setName("김동진");
        member.setNickName("깡깡이");
        member.setGender("M");
        member.setPhoneNumber("010-1234-5678");
        member.setPassword("admin123!@");
        member.setAddress("서울시 금천구 디지털로 130 남성프라자 1007호");


        boolean flag = mapper.register(member);

        assertTrue(flag);
    }


    @Test
    @DisplayName("등록된 이메일을 통해 해당 회원이 정상적으로 조회되어야 한다.")
    void findMemberTest() {
        String email = "admin123@naver.com";
        Member member = mapper.findMember(email);
        String name = member.getName();

        assertEquals("김동진", name);
    }


    @Test
    @DisplayName("이미 존재하는 이메일 또는 닉네임을 입력하면 결과값이 1이 나와야 한다.")
    void duplicateTest() {
        String email = "admin123@naver.com";
        String nickName = "관리자";

        DuplicateDTO dto = new DuplicateDTO();
        dto.setType("email");
        dto.setValue(email);

        int result1 = mapper.isDuplicate(dto);

        DuplicateDTO dto2 = new DuplicateDTO();
        dto.setType("nick_name");
        dto.setValue(nickName);

        int result2 = mapper.isDuplicate(dto2);

        assertTrue(result1 == 1 && result2 == 1);
    }


//    @Test
//    @DisplayName("이메일을 주면 해당 회원의 권한이 변경되어야 한다.")
//    void authChangeTest() {
//        AuthDTO dto = new AuthDTO();
//        dto.setAuth("ADMIN");
//        dto.setEmail("admin123@naver.com");
//        boolean flag = mapper.authChange(dto);
//
//        assertTrue(flag);
//    }


    @Test
    @DisplayName("비번 검증을 통해 회원이 삭제되어야 한다.")
    void deleteMemberTest() {
        DeleteMemberDTO dto = new DeleteMemberDTO();
        dto.setPassword("admin123!@");
        dto.setEmail("kdf556@naver.com");

        Member member = mapper.findMember(dto.getEmail());
        String password = member.getPassword();

        if (password.equals(dto.getPassword())) {
            boolean flag = mapper.deleteMember(dto.getEmail());
            assertTrue(flag);
        }
    }


    @Test
    @DisplayName("이메일 값으로 사람 찾고 그 사람 정보 바꿈")
    void newMemberModiTest(){ // 성공!
        String email = "soslimso@nate.com";
        Member member = mapper.findMember(email);
        System.out.println("\n\n\n=================\n\n\n");
        System.out.println(member);
        System.out.println("\n\n\n=================\n\n\n");
        NewModifyMemberDTO newModifyMemberDTO = new NewModifyMemberDTO();
        newModifyMemberDTO.setPhoneNumber("010-5151-5151");
        newModifyMemberDTO.setEmail("soslimso@nate.com");
        newModifyMemberDTO.setNickName("도니수정");
        newModifyMemberDTO.setAddress("수정된");
        newModifyMemberDTO.setDetailAddress("디테일한");
        newModifyMemberDTO.setExtraAddress("엑스트라 010");
        System.out.println("\n\n\n=================\n\n\n");
        boolean b = mapper.newMemberModi(newModifyMemberDTO);
        Member member1 = mapper.findMember(email);
        System.out.println(member1);
        System.out.println("\n\n\n=================\n\n\n");
        assertTrue(b);

    }


    @Test
    @DisplayName("이메일 넣으면 회원 삭제되어야 함 ")
    void deleteIntoProfile(){ // 성공

        String email = "bbb@nate.com";

        boolean b = mapper.deleteMemberIntoProfile(email);

        assertTrue(b);
    }


}