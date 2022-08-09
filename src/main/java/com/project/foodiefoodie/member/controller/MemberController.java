package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.AutoLoginDTO;
import com.project.foodiefoodie.member.dto.DeleteMemberDTO;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import com.project.foodiefoodie.member.dto.LoginDTO;
import com.project.foodiefoodie.member.service.LoginFlag;
import com.project.foodiefoodie.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.project.foodiefoodie.member.service.LoginFlag.*;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MemberController {

    private final MemberService memberService;


    // 회원 가입 화면 요청 처리
    @GetMapping("/register")
    public String register() {
        log.info("/register GET!!");
        return "/member/register";
    }


    // 아이디, 이메일 중복확인 비동기 요청 처리
    @GetMapping("/member/check")
    @ResponseBody
    public ResponseEntity<Boolean> check(DuplicateDTO dto) {
        log.info("/member/check?type={}&value={} GET!! ASYNC", dto.getType(), dto.getValue());

        boolean flag = memberService.checkDuplicate(dto);

        return new ResponseEntity<>(flag, HttpStatus.OK);
    }


    // 실질적 회원 가입 요청 처리
    @PostMapping("/register")
    public String realRegister(Member member) {
        log.info("/register POST! - {}", member);

        memberService.registerService(member);

        return "/member/success-regist";
    }


    // 모달 창에서 로그인 비동기 요청 처리
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<LoginFlag> login(LoginDTO inputData,
                                HttpServletResponse response,
                                        HttpSession session,
                                        Model model) {

//        LoginDTO inputData = new LoginDTO(email, password, autoLogin);

        log.info("/login ASYNC POST!! - {} ", inputData);

//        String referer = request.getHeader("Referer");
//        log.info("referer - {}", referer);

        LoginFlag flag = memberService.loginService(inputData, session, response);


        if (flag == SUCCESS) {
            log.info("login success");

            return new ResponseEntity<>(flag, HttpStatus.OK);

        } else if (flag == NO_PW) {
            log.info("login no-pw");
            return new ResponseEntity<>(flag, HttpStatus.FORBIDDEN);

        } else {
            log.info("login no-email");
            return new ResponseEntity<>(flag, HttpStatus.NOT_FOUND);
        }
    }
    
    
    // 로그아웃 요청 처리
    @GetMapping("/logout")
    public String logout() {
        return "";
    }
}
