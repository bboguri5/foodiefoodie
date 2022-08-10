package com.project.foodiefoodie.member.interceptor;

import com.project.foodiefoodie.util.LoginUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration
public class AfterLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        if (LoginUtils.isLogin(session)){
            String referer = request.getHeader("Referer");

            response.sendRedirect(referer);
            return false;
        }

        return true;
    }
}