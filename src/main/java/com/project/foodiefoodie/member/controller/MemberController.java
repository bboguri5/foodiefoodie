package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import com.project.foodiefoodie.member.dto.ModifyDTO;
import com.project.foodiefoodie.member.dto.PasswordDTO;
import com.project.foodiefoodie.member.dto.login.LoginDTO;
import com.project.foodiefoodie.member.service.LoginFlag;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public ResponseEntity<String> login(@RequestBody LoginDTO inputData,
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

            return new ResponseEntity<>(flag.toString(), HttpStatus.OK);

        } else if (flag == NO_PW) {
            log.info("login no-pw");
            return new ResponseEntity<>(flag.toString(), HttpStatus.FORBIDDEN);

        } else {
            log.info("login no-email");
            return new ResponseEntity<>(flag.toString(), HttpStatus.NOT_FOUND);
        }
    }
    
    
    // 로그아웃 요청 처리
    @GetMapping("/sign-out")
    public String logout(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        if (LoginUtils.isLogin(session)) { // 로그인 중인 상태라면~~

            // 자동로그인까지 해놓고 있던 상태라면 해제!!
            if (LoginUtils.hasAutoLoginCookie(request)) {
                memberService.autoLogout(LoginUtils.getCurrentMemberEmail(session), request, response);
            }

            // 세션에서 정보 삭제 및 세션 무효화
            session.removeAttribute(LoginUtils.LOGIN_FLAG);
            session.invalidate();
            return "redirect:/";
        }

        // 로그인 상태가 아니라면~
        return "redirect:/";
    }


    @GetMapping("/myPage-profile")
    public String myPageProfile(HttpSession session, Model model){
        Member loginUser =(Member) session.getAttribute("loginUser");
        // 새션에는 값이 안변하니까 값이 변한 DB 데이터 값을 가져온다 !
        Member member = memberService.findMember(loginUser.getEmail());
        model.addAttribute("member",member);
        log.info("myPage-profile");
        return "/myPage/myPage-profile";
    }
    @GetMapping("/myPage-modify")
    public String myPageModify(){
        log.info("myPage-modify");
        return "/myPage/myPage-modify";
    }

    @PostMapping("/modifyMember")
    public String PostModifyMember(HttpSession session , ModifyDTO modifyDTO ){
        log.info("modifyDTO : {}" , modifyDTO);
        memberService.modifyMemberService(modifyDTO);
        log.info("go service ");
        return "redirect:/myPage-profile";
    }

    // 비밀번호 수정 하는 페이지
    @GetMapping("/myReview")
    public String getChangePassword(){

        return "/myPage/myPage-myReview";
    }
//
//    @PostMapping("/changePassword")
//    public String postChangePassword(String word){
//        return "/myPage/myPage-changePassword";
//    }

    @PostMapping("/trueAndFalsePassword")
    @ResponseBody
    public String trueAndFalsePassword(HttpSession session , @RequestBody PasswordDTO password){
        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        log.info("password =  {} " , password.getPassword());
        boolean passwordService= memberService.findPasswordService(member.getEmail(), password.getPassword());
        log.info("passwordService ========= {}",passwordService);
        if (passwordService){
            log.info("password-success");
            return "password-success";
        }else {
            log.info("password-false");
            return "password-false";
        }
    }




}
