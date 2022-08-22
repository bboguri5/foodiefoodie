package com.project.foodiefoodie.common.api.payment.controller;

import com.project.foodiefoodie.common.api.KakaoMyApp;
import com.project.foodiefoodie.common.api.payment.service.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

        model.addAttribute("pcUrl", pcRedirectUrl);

        return "payment/test-result";
    }


    // 결제 성공시 api에서 보낼 요청
    @GetMapping("/success-order")
    public String success() {
        return "payment/success-order";
    }


    // 결제 취소시 api에서 보낼 요청 
    @GetMapping("/cancel-order")
    public String cancel() {
        return "payment/cancel-order";
    }


    // 결제 실패시 api에서 보낼 요청
    @GetMapping("/fail-order")
    public String fail() {
        return "payment/fail-order";
    }
}
