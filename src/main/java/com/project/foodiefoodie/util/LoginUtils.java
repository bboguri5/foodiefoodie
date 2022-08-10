package com.project.foodiefoodie.util;

import com.project.foodiefoodie.member.domain.Member;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtils {

    public static final String LOGIN_FLAG = "loginUser";
    public static final String LOGIN_FROM = "loginMethod";
    public static final String LOGIN_COOKIE = "autoLoginCookie";


    // 로그인 했는지 알려주기~~
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_FLAG) != null;
    }


    // 로그인한 사용자 계정 가져오기
    public static String getCurrentMemberEmail(HttpSession session) {
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getEmail();
    }


    // 로그인한 사용자 권한 가져오기
    public static String getCurrentMemberAuth(HttpSession session) {
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getAuth().toString(); // 열거형이라서 toString() 메서드 활용
    }


    // 자동로그인 쿠키 가져오기
    public static Cookie getAutoLoginCookie(HttpServletRequest request) {
        return WebUtils.getCookie(request, LOGIN_COOKIE);
    }



    // 자동로그인 쿠키가 있는지 여부를 확인하기
    public static boolean hasAutoLoginCookie(HttpServletRequest request) {
        return getAutoLoginCookie(request) != null;
    }
}
