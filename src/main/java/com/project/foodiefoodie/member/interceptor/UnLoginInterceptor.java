package com.project.foodiefoodie.member.interceptor;

import com.project.foodiefoodie.util.LoginUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration
@Log4j2
public class UnLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        if (!LoginUtils.isLogin(session)) {

            String referer = request.getHeader("Referer");
            log.info("UnLoginRequest! referer : {}", referer);

            response.sendRedirect("/login");

            session.removeAttribute("menuInfoList");
            session.removeAttribute("totalPrice");
            session.removeAttribute("businessNo");
            session.removeAttribute("totalQuantity");
            session.removeAttribute("discount");

            return false;
        }

        return true;
    }
}
