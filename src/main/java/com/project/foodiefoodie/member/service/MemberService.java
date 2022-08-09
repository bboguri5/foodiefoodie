package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.DeleteMemberDTO;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import com.project.foodiefoodie.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class MemberService {

    private final MemberMapper memberMapper;

    private final BCryptPasswordEncoder encoder;



    // 회원가입 중간처리
    public boolean registerService(Member member) {

        // 비밀번호 인코딩 처리
        member.setPassword(encoder.encode(member.getPassword()));

        boolean flag = memberMapper.register(member);

        return flag;
    }



    // 이메일, 닉네임 중복확인 중간처리
    public boolean checkDuplicate(DuplicateDTO dto) {

        // 중복이면 결과값으로 1이 나옴.
        int result = memberMapper.isDuplicate(dto);

        return result == 1;
    }



    // 개별 회원 조회 중간처리
    public Member findMember(String email) {
        return memberMapper.findMember(email);
    }



    // 회원 탈퇴 중간처리
    /**
     *
     * @param dto - email : 마이페이지에서 그대로 들고올 회원 이메일 // password : 삭제하기 위해 입력한 비밀번호
     * @return db에 등록된 해당 이메일의 비밀번호를 디코딩했을 때 dto 속 pw 값과 일치하면 삭제처리 후 true
     */
    public boolean deleteMemberService(DeleteMemberDTO dto) {

        Member member = memberMapper.findMember(dto.getEmail());
        String password = member.getPassword();

        if (encoder.matches(password, dto.getPassword())) {
            return memberMapper.deleteMember(dto.getEmail());
        }

        return false;
    }



    // 회원 수정 중간처리 (만들어야 함)
    public boolean modifyMemberService() {
        return false;
    }



//    public LoginFlag loginService() {
//
//    }
}
