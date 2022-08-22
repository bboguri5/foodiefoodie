package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.dto.find.FindEmailDTO;
import com.project.foodiefoodie.member.dto.find.FindPwDTO;
import com.project.foodiefoodie.member.dto.login.AutoLoginDTO;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {

    // 회원가입 기능
    boolean register(Member member);


    // 중복체크 기능
    // 체크타입 : 이메일 or 닉네임
    // 체크값 : 중복검사대상 값
    int isDuplicate(DuplicateDTO checker);

    // 회원정보 조회 기능
    Member findMember(String email);



    // 회원 탈퇴 기능
    boolean deleteMember(String email);


    // 회원 정보 수정 기능
    boolean modifyMember(Member member);


    // 자동로그인 쿠키값(세션 아이디값) DB에 저장
    void saveAutoLoginValue(AutoLoginDTO dto);

    void deleteAutoLoginValue(String email);


    // 쿠키값(세션아이디)을 가지고 있는 회원 이메일 조회
    AutoLoginDTO findIsAutoLoginBySessionId(String sessionId);

    List<Member> findAll();
    List<Member> findCommon();
    Member findOneCommon(String email);
    boolean remove(String email);


    String findEmail(FindEmailDTO dto);

    int findPw(FindPwDTO dto);

    boolean changePw(String email, String pw);
}
