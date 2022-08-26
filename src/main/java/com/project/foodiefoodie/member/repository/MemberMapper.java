package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.dto.ModifyDTO;
import com.project.foodiefoodie.member.dto.NewModifyMemberDTO;
import com.project.foodiefoodie.member.dto.find.FindEmailDTO;
import com.project.foodiefoodie.member.dto.find.FindPwDTO;
import com.project.foodiefoodie.member.dto.login.AutoLoginDTO;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
    boolean modifyMember(ModifyDTO modifyDTO);

    boolean modifyPassword(String password);


    // 자동로그인 쿠키값(세션 아이디값) DB에 저장
    void saveAutoLoginValue(AutoLoginDTO dto);

    void deleteAutoLoginValue(String email);


    // 쿠키값(세션아이디)을 가지고 있는 회원 이메일 조회
    AutoLoginDTO findIsAutoLoginBySessionId(String sessionId);

    List<Member> findAll();
    List<Member> findCommon();
    Member findOneCommon(String email);
    boolean remove(String email);


    List<String> findEmail(FindEmailDTO dto);

    int findPw(FindPwDTO dto);

    boolean changePw(String email, String newPw);


    // 비밀번호 가져오는 메서드 // 이걸로 비밀번호만 검증할것임 // 수정할때나 , 비밀번호 바꿀때
    String findPassword(String email);

    // 새로운 맴버 수정
    boolean newMemberModi(NewModifyMemberDTO newModifyMemberDTO);


}
