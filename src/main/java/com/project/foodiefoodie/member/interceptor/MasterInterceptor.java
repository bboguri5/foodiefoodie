package com.project.foodiefoodie.member.interceptor;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Configuration
@Log4j2
public class MasterInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        log.info("MASTER interceptor preHandle");
        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        if (loginUser != null) {
            if (!Objects.equals(loginUser.getAuth().toString(),"MASTER")) {
                response.sendRedirect("/");
                return false;
            }
            return true;
        }
        return false;
    }
}
