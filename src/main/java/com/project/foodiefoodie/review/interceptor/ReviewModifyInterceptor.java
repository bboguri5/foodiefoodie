package com.project.foodiefoodie.review.interceptor;

import com.project.foodiefoodie.member.domain.Member;
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

import static com.project.foodiefoodie.util.LoginUtils.getCurrentMemberEmail;

@Configuration
@Log4j2
public class ReviewModifyInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        if (!LoginUtils.isLogin(session)) {

            String referer = request.getHeader("Referer");
//            log.info("UnLoginRequest! referer : {}", referer);

            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect("/"); // 메인으로 돌리기
            }

            return false;
        }

        return true;
    }

    // 후처리 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("111111postHandle!!!!!");
        // postHandle이 작동해야 하는 URI 목록
        List<String> uriList = Arrays.asList("/review/modify");

        // 현재 요청 URI 정보 알아내기
        String requestURI = request.getRequestURI();

        String[] split = requestURI.split("/");
        for (String s : split) {
            log.info("s - {}", s);
        }
        String t = "";
        for (int i = 1; i < split.length - 1; i++) {
            t += "/"+split[i];
        }
        log.info("t - {}", t);
        log.info("requestURI - {}", requestURI);
//        String method = null;

        // uriList 안에 요청 uri가 있다면 작동
        if (uriList.contains(t)) {
            // 현재 요청 메서드 정보 확인
//            method = request.getMethod();
            log.info("222222postHandle!!!!!");

            // /review/modify 에 Map 가져오기
            Map<String, Object> modelMap = modelAndView.getModel();
            ReviewBoardDTO review = (ReviewBoardDTO) modelMap.get("review");
            HttpSession session = request.getSession();

            // 작성자와 로그인유저 비교 후 다르면 return
            String writer = review.getEmail();
            log.info("writer - {}", writer);
            String loginUser = getCurrentMemberEmail(session);
            log.info("loginUser - {}", loginUser);
            Member loginUser1 = (Member) session.getAttribute("loginUser");
            log.info("loginUser1 - {}", loginUser1);
            log.info("aaaaa - {}", loginUser1.getAuth().toString().equals("ADMIN"));
            if (loginUser1.getAuth().toString().equals("ADMIN")) return;

            String referer = request.getHeader("Referer");
            if (!Objects.equals(writer, loginUser)) {
                response.sendRedirect(referer);
            }
        }

    }

}
