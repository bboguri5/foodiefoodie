package com.project.foodiefoodie.common.api.payment.controller;

import com.project.foodiefoodie.common.api.KakaoMyApp;
import com.project.foodiefoodie.common.api.payment.domain.PaymentProduct;
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
import java.util.List;
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


    // 주문 데이터를 들고 주문 확인창으로 이동 요청 처리
    @GetMapping("/kakao/order/request")
    public String orderRequest(List<String> menu, List<Integer> quantity , List<Integer> price, Model model, HttpSession session) {
        log.info("/order/request GET!! - {}, {}, {}", menu, quantity, price);


        session.setAttribute("menuList", menu);
        session.setAttribute("quantityList", quantity);
        session.setAttribute("priceList", price);

        return "payment/check-order"; // -> 확인창에서 최종 주문 요청을 하게 되면 KakaoController에서 작업 수행.
    }


//    @GetMapping("/kakao/payment-test")
    @PostMapping("/kakao/order/request")
    public String test(HttpSession session, PaymentProduct orderInfo, Model model) throws IOException {

        log.info("/kakao/order/request POST!! - {}", orderInfo);

        // 결제 준비를 위해 Post 요청이 수행되어야 함.
        Map<String, String> readyForPaymentMap = kakaoService.readyForPayment(session, orderInfo);

        String pcRedirectUrl = readyForPaymentMap.get("pcRedirectUrl");


        // 결제 성공 url을 받아왔다면 db에 반영해줘야 함.
        String paymentFlag = pcRedirectUrl.substring(pcRedirectUrl.lastIndexOf("/"));

        if (paymentFlag.equals("success-order")) {
            kakaoService.insertOrderInfoToDB(session, orderInfo.getBusinessNo());
        }

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
