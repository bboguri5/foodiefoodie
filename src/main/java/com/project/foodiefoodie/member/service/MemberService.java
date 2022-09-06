package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.common.api.mail.service.EmailServiceImpl;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.ModifyDTO;
import com.project.foodiefoodie.member.dto.NewModifyMemberDTO;
import com.project.foodiefoodie.member.dto.find.FindEmailDTO;
import com.project.foodiefoodie.member.dto.find.FindPwDTO;
import com.project.foodiefoodie.member.dto.login.AutoLoginDTO;
import com.project.foodiefoodie.member.dto.DeleteMemberDTO;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import com.project.foodiefoodie.member.dto.login.LoginDTO;
import com.project.foodiefoodie.member.repository.MemberMapper;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class MemberService {

    private final MemberMapper memberMapper;
    private final EmailServiceImpl emailService;

    private final BCryptPasswordEncoder encoder;
    private final MasterService masterService;


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


    // 회원 수정 중간처리 수정됨 // NewModifyMemberDTO
    public boolean modifyMemberService(NewModifyMemberDTO newModifyMemberDTO) {
        log.info("go mapper modi {}", newModifyMemberDTO);
        newModifyMemberDTO.setEmail(newModifyMemberDTO.getEmail().trim());
        boolean b = memberMapper.newMemberModi(newModifyMemberDTO);
        return b;
    }


    public LoginFlag loginService(LoginDTO inputData, HttpSession session, HttpServletResponse response) {

        String email = inputData.getEmail();

        Member foundMember = memberMapper.findMember(email);


        // 존재하는 회원이라면
        if (foundMember != null) {

            // 비밀 번호 일치 여부 확인
            if (encoder.matches(inputData.getPassword(), foundMember.getPassword())) {
                // 로그인 성공한 경우,


                session.setAttribute(LoginUtils.LOGIN_FLAG, foundMember);
                session.setMaxInactiveInterval(60 * 60);

                // 마스터들 정보 불러오기
                List<Master> masters = masterService.allMaster(email);
                int i = masterService.masterCountService(email);
                // 세션에 마스터 정보 넣기
                if (i > 0) { // 마스터가 아닐수도 있으니까

                    session.setAttribute("masterList", masters);
                    session.setAttribute("masterCount", i);
                }

                // 자동로그인을 체크한 경우라면,
                if (inputData.isAutoLogin()) {
                    rememberMe(foundMember.getEmail(), session, response);
                }


                return LoginFlag.SUCCESS;

            } else {
                return LoginFlag.NO_PW;
            }

        } else {
            return LoginFlag.NO_EMAIL;
        }
    }

    private void rememberMe(String email, HttpSession session, HttpServletResponse response) {
        // 1. 자동로그인 쿠키 생성 - 쿠키의 값으로 현재 세션의 아이디를 저장한다.
        String sessionId = session.getId();
        Cookie cookie = new Cookie(LoginUtils.LOGIN_COOKIE, sessionId);


        // 2. 쿠키 설정 (수명, 사용 경로)
        int limitTime = 60 * 60 * 24 * 90; // 90일에 대한 초단위 표현
        cookie.setMaxAge(limitTime);
        cookie.setPath("/"); // 전체 경로에서 사용할 수 있어야 한다.
        // 사용자가 어떤 경로에서 접근을 하더라도 자동로그인이 되어야 하기 때문!!


        // 3. 자동로그인을 체크하고 로그인에 성공한 해당 유저의 로컬에 쿠키 전송
        response.addCookie(cookie);


        // 4. DB에 쿠키값과 수명 저장
        AutoLoginDTO dto = new AutoLoginDTO();
        dto.setSessionId(sessionId);


        // 4-1. 수명은 좀 생각해봐야 한다. 왜?? DB에는 DATE라서 날짜형식으로 넣어야 하는데 위에 limitTime은 초단위이기 때문!!
        // 자동로그인 유지시간(초)을 날짜로 변환
        long nowTime = System.currentTimeMillis();
        Date limitDate = new Date(nowTime + ((long) limitTime * 1000)); // 밀리초는 1000분의 1초
        dto.setLimitTime(limitDate);


        dto.setEmail(email);


        memberMapper.saveAutoLoginValue(dto); // 최종적 DB 저장.
    }


    // 자동로그인 해제 중간처리
    public void autoLogout(String email, HttpServletRequest request, HttpServletResponse response) {

        Cookie cookie = LoginUtils.getAutoLoginCookie(request);

        if (cookie != null) {
            // 1. 해당 로그아웃 요청 보낸 로컬 환경에 쿠키 수명 0으로 보내기
            cookie.setMaxAge(0);
            response.addCookie(cookie);


            // 2. DB에서도 기록 지우기
            memberMapper.deleteAutoLoginValue(email);
        }
    }

    // 전체 조회
    public List<Member> findAllService() {
        List<Member> memberList = memberMapper.findAll();
        return memberList;
    }

    // 일반회원만 조회
    public List<Member> findCommonService() {
        List<Member> memberList = memberMapper.findCommon();
        return memberList;
    }

    // 일반회원 단일 객체 조회
    public Member findOneCommonService(String email) {
        Member member = memberMapper.findOneCommon(email);
        return member;
    }

    // 회원 탈퇴
    public boolean removeService(String email) {
        boolean flag = memberMapper.remove(email);
        return flag;
    }


    // 비밀번호 검증 메서드
    public boolean findPasswordService(String email, String password) { // 정상작동함
        String dbPassword = memberMapper.findPassword(email);
        if (encoder.matches(password, dbPassword)) {
            return true;
        } else {
            return false;
        }
    }


    // 계정(이메일) 찾기
    public List<String> findEmail(FindEmailDTO dto) {
        List<String> emailList = memberMapper.findEmail(dto);
        return emailList;
    }


    // 비번 변경용 회원 존재 유무 찾기
    public String findPw(FindPwDTO dto) throws Exception {

        if (memberMapper.findPw(dto) == 1) {
            // 이메일 보내는 로직이 수행되어야 함.
            String email = dto.getEmail();
            String authCode = emailService.sendAuthCodeEmail(email);

            return authCode;
        }

        return null;
    }

    public boolean changePw(String email, String newPw) {

        String encodedPw = encoder.encode(newPw);

        return memberMapper.changePw(email, encodedPw);
    }

    public String sendEmailAuthCode(String email) throws Exception {
        return emailService.sendAuthCodeEmail(email);
    }

    // 맴버 삭제 해주는 메서드
    public boolean deleteMemberIntoProfileService(String email){
        boolean b = memberMapper.deleteMemberIntoProfile(email);
        return b;
    }

    // 맴버 강등시키는 메서드
    public boolean authDownCommonTest(String email){
        boolean b = memberMapper.authDownCommon(email);
        return b;
    }

}
