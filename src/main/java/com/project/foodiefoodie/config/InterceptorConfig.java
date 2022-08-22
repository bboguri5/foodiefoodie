package com.project.foodiefoodie.config;

import com.project.foodiefoodie.member.interceptor.AfterLoginInterceptor;
import com.project.foodiefoodie.member.interceptor.AutoLoginInterceptor;
import com.project.foodiefoodie.member.interceptor.UnLoginInterceptor;
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
    private final UnLoginInterceptor unLoginInterceptor;


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
    }
}
