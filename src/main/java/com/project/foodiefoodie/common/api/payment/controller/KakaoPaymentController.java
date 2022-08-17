package com.project.foodiefoodie.common.api.payment.controller;

import com.project.foodiefoodie.common.api.KakaoMyApp;
import com.project.foodiefoodie.common.api.payment.service.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class KakaoPaymentController {

    private final KakaoService kakaoService;

    @GetMapping("/kakao-test")
    public String test() {
        return "payment/kakao-payment-test";
    }


    @GetMapping("/kakao/payment-test")
    public String test(HttpSession session, Model model) throws IOException {

        log.info("/kakao/payment-test GET!!");

        // 결제 준비를 위해 Post 요청이 수행되어야 함.
        Map<String, String> readyForPaymentMap = kakaoService.readyForPayment(session);

        String pcRedirectUrl = readyForPaymentMap.get("pcRedirectUrl");

        session.setAttribute("pcUrl", pcRedirectUrl);

        return "redirect:/" + pcRedirectUrl;
    }

}
