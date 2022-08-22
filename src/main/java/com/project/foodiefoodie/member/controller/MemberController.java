package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.DuplicateDTO;
import com.project.foodiefoodie.member.dto.find.EmailCodeDTO;
import com.project.foodiefoodie.member.dto.find.FindEmailDTO;
import com.project.foodiefoodie.member.dto.find.FindPwDTO;
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



    // 계정 찾기 화면 요청 처리
    @GetMapping("/find-email")
    public String findEmail() {
        log.info("/find-email GET!!");
        return "member/find/find-email";
    }



    // 실질적 계정 찾기 요청 처리
    @PostMapping("/find-email")
    public String findEmail2(FindEmailDTO dto, Model model) {
        log.info("/find-email POST!! - {}", dto);

        String foundEmail = memberService.findEmail(dto);

        model.addAttribute("foundEmail", foundEmail); // null 검증은 클라이언트 쪽에서 하자.

        return "member/find/find-email-result";
    }



    // 비번 찾기 화면 요청 처리
    @GetMapping("/find-pw")
    public String findPw() {
        return "member/find/find-pw";
    }



    // 실질적 비번 찾기 요청 처리
    @PostMapping("/find-pw")
    public String findPw2(FindPwDTO dto, Model model) throws Exception {
        log.info("/find-pw POST!! - {}", dto);

        String authCode = memberService.findPw(dto);

        model.addAttribute("authCode", authCode);
        model.addAttribute("email", dto.getEmail());

        return "member/find/find-pw-result";
    }


    // 인증 코드 검증 요청 처리
    @PostMapping("/check-authCode")
    public String checkAuth(EmailCodeDTO dto, Model model) {
        log.info("/check-authCode POST!! - {}", dto);

        String authCode = dto.getAuthCode();
        String realAuthCode = dto.getRealAuthCode();

        boolean flag = false;

        if (authCode.equals(realAuthCode)) {
            flag = true;
        }

        model.addAttribute("flag", flag); // true가 나오면 인증코드가 일치한 것이므로 해당 페이지 내에서 비번 변경하게 해주기.
        model.addAttribute("email", dto.getEmail());


        return "member/find/check-emailCode-result";
    }



    // 비밀번호 변경 요청 처리
    @PostMapping("/change-pw")
    public String changePw(String email, String pw) {
        log.info("/change-pw POST!! - email : {}, pw : {}", email, pw);

        boolean flag = memberService.changePw(email, pw);


        return "member/find/change-pw-success";
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

//
//    @GetMapping("/myReview")
//    public String getChangePassword(){
//
//        return "/myPage/myPage-myReview";
//    }
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
