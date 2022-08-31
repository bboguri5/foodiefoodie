package com.project.foodiefoodie.common.api.payment.controller;

import com.project.foodiefoodie.common.api.payment.dto.MenuInfo;
import com.project.foodiefoodie.common.api.payment.service.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class KakaoPaymentController {

    private final KakaoService kakaoService;



    // 주문 데이터를 들고 주문 확인창으로 이동 요청 처리
    @PostMapping("/kakao/order/check")
    @ResponseBody
    public String orderRequest(@RequestBody Map<String, Object> orderMap, HttpServletRequest request) {
        String businessNo = (String) orderMap.get("businessNo");
        int discount = (int) orderMap.get("discount");

        log.info("orderMap.getDiscount!! - {}", discount);

        List<MenuInfo> menuInfoList = (List<MenuInfo>) orderMap.get("menuList");
        log.info("orderMap.get!! menuInfoList : {}", menuInfoList);

        HttpSession session = request.getSession();

        session.setAttribute("menuInfoList", menuInfoList);
        session.setAttribute("businessNo", businessNo);
        session.setAttribute("discount", discount);

        int totalQuantity = 0;
        int totalPrice = 0;

        if (menuInfoList != null) {
            for (MenuInfo menuInfo : menuInfoList) {
                totalPrice += menuInfo.getMenuPrice();
                totalQuantity += menuInfo.getQuantity();
            }
        }

        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("totalQuantity", totalQuantity);


        return "order-success"; // -> 확인창에서 최종 주문 요청을 하게 되면 KakaoController에서 작업 수행.
    }


    @GetMapping("/kakao/order/check/request")
    public String hey(HttpSession session) {
        List<MenuInfo> menuInfoList = (List<MenuInfo>) session.getAttribute("menuInfoList");
        log.info("/kakao/order/check GET!! - {}", menuInfoList);
        return "payment/check-order";
    }


    @PostMapping("/kakao/order/request")
    public String test(HttpSession session, Model model) throws IOException {

        log.info("/kakao/order/request POST!!");

        // 결제 준비를 위해 Post 요청이 수행되어야 함.
        Map<String, String> readyForPaymentMap = kakaoService.readyForPayment(session);

        String pcRedirectUrl = readyForPaymentMap.get("pcRedirectUrl");



        model.addAttribute("pcUrl", pcRedirectUrl);

        return "payment/check-order";
    }


    // 재주문하기 누른 경우 이전 화면으로 돌려줄 비동기 요청 처리
    @GetMapping("/reOrder")
    @ResponseBody
    public String reOrder(HttpServletRequest request) {
        String referer = request.getHeader("Referer");
        if (referer == null) {
            return "/";
        }
        return referer;
    }


    // 결제 성공시 api에서 보낼 요청
    @GetMapping("/success-order")
    public String success(HttpSession session) {
        kakaoService.insertOrderInfoToDB(session);
        return "payment/success-order";
    }



    // 결제 취소시 api에서 보낼 요청 
    @GetMapping("/cancel-order")
    public String cancel(HttpSession session) {
        session.removeAttribute("menuInfoList");
        session.removeAttribute("totalPrice");
        session.removeAttribute("businessNo");
        session.removeAttribute("totalQuantity");
        session.removeAttribute("discount");
        return "payment/cancel-order";
    }


    // 결제 실패시 api에서 보낼 요청
    @GetMapping("/fail-order")
    public String fail(HttpSession session) {
        session.removeAttribute("menuInfoList");
        session.removeAttribute("totalPrice");
        session.removeAttribute("businessNo");
        session.removeAttribute("totalQuantity");
        session.removeAttribute("discount");
        return "payment/fail-order";
    }
}
