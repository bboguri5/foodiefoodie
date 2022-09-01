package com.project.foodiefoodie.config;

import com.project.foodiefoodie.member.interceptor.*;
import com.project.foodiefoodie.member.repository.MemberMapper;
import com.project.foodiefoodie.review.interceptor.ReviewModifyInterceptor;
import com.project.foodiefoodie.review.interceptor.ReviewWriteInterceptor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
@Log4j2
public class InterceptorConfig implements WebMvcConfigurer {

    private final AutoLoginInterceptor autoLoginInterceptor;
    private final AfterLoginInterceptor afterLoginInterceptor;
    private final AdminInterceptor adminInterceptor;
    private final UnLoginInterceptor unLoginInterceptor;

    private final UnCheckedOrderInterceptor unCheckedOrderInterceptor;

    private final ReviewWriteInterceptor reviewWriteInterceptor;

    private final ReviewModifyInterceptor reviewModifyInterceptor;
    // 인터셉터 설정 추가 메서드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //자동 로그인 인터셉터 설정
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");


        // 로그인 후 회원가입 및 로그인, email, pw 찾기 및 변경 URL 진입 차단
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/login", "/register", "/find/*");


        // 로그인 하지 않은 경우 차단할 요청들 나열하기
        registry.addInterceptor(unLoginInterceptor)
                .addPathPatterns("/kakao/order/check/request", "/master/*", "/myPage/*", "/insertDB", "/fail-order", "/success-order", "/cancel-order");

        // 관리자 페이지 인터셉터 설정
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/*");

        // 리뷰 작성화면 인터셉터
        registry.addInterceptor(reviewWriteInterceptor)
                .addPathPatterns("/review/write");

        // 리뷰 수정화면 인터셉터
        registry.addInterceptor(reviewModifyInterceptor)
                .addPathPatterns("/review/modify/*");





//        registry.addInterceptor(unCheckedOrderInterceptor)
//                .addPathPatterns("/kakao/order/check/request");
    }
}
