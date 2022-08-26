package com.project.foodiefoodie.config;

import com.project.foodiefoodie.member.interceptor.*;
import com.project.foodiefoodie.member.repository.MemberMapper;
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

    private final MemberInterceptor memberInterceptor;

    private final MasterInterceptor masterInterceptor;


    // 인터셉터 설정 추가 메서드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //자동 로그인 인터셉터 설정
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");


        // 로그인 후 회원가입 및 로그인 재진입 차단
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/login", "/register", "/find-email", "find-pw");


        // 로그인 하지 않은 경우 차단할 요청들 나열하기
        registry.addInterceptor(unLoginInterceptor)
                .addPathPatterns("/kakao/payment-test");

        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/*");

        registry.addInterceptor(memberInterceptor)
                .addPathPatterns("/myPage");

        // 아직 경로가 정해지지 않아서 일단 주석처리 합니다.
        // registry.addInterceptor(masterInterceptor)
//                 .addPathPatterns("/myPage/masterPage");


    }
}
