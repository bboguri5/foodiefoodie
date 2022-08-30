package com.project.foodiefoodie.review.interceptor;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Configuration
@Log4j2
public class ReviewWriteInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        if (!LoginUtils.isLogin(session)) {

            String referer = request.getHeader("Referer");
            log.info("UnLoginRequest! referer : {}", referer);

            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect("/"); // 메인으로 돌리기
            }

            return false;
        }

        return true;
    }
}
