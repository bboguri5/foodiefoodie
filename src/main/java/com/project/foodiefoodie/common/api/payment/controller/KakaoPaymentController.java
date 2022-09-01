package com.project.foodiefoodie.common.api.payment.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        int discount;
            // 핫딜이 적용된 가게가 아니라면
        if (orderMap.get("discount").equals("")) {
            discount = 0;
        }
        // 핫딜 진행 중인 가게라면
        else {
            discount = Integer.parseInt(String.valueOf(orderMap.get("discount")));
        }

        log.info("orderMap.getDiscount!! - {}", discount);
        log.info("orderMap!! - {}", orderMap);


        ObjectMapper objectMapper = new ObjectMapper();


        // js에서 비동기처리로 서버에 받아온 json데이터들이 다 자바스크립트 객체 형태로 데이터가 존재하지만 엄밀히는 문자열이다.
        // 그래서 그 문자열을 파싱해서 사용해야 하는데.. 그걸 스프링에서는 잭슨 라이브러리가 해준다.
            // 자바에 들어온 json 데이터를 변환할 때도!
            // 어떤 비동기 처리에 의한 데이터를 서버에서 클라이언트로 json 형태로 보낼 때도!! 잭슨 라이브러리는 열일한다.
        // js -> 서버로 Map에 여러 데이터들을 담아 한번에 받는 와중에 배열 형태의 데이터를 받았는데!
        // 그걸 서버에서 받을 때 제네릭 타입이 커맨드 객체인 리스트로 받아달라고 했더니.. (List<MenuInfo> 이렇게 받고자 했다!)
        // 로그를 찍어서 잘 받아왔는지 확인해보면 로그에는 찍히지만.. 이상하게 Exception 이 뜨는 것을 볼 수 있다.
        // casting 얘기가 나오고 List 얘기가 나온다면.. 아래 주석을 더 참고하면 된다.

        // 제네릭 타입을 설정해서 이대로 받아달라고 요청할 때!!
        // 해당 제네릭 타입이 기본형(int, String, double..)이 아닌,, // 커스텀 객체 (List< ~~DTO>) 형태로 받고자 한다면..
        // 원활히 변환이 이루어지지 않고 에러가 발생한다.
        // 그 때는 잭슨 라이브러리에게 해당 데이터를 이런 식으로 변환해달라는 요청을 따로 보내야 한다! (제네릭 타입 명시!!)

            // 결론.. 그래서 어떻게 하는거냐!!
        // ObjectMapper 객체 생성 이후 convertValue 메서드 활용!!
        // 매개변수는 2개를 사용하고 첫번째 매개변수에는 내가 js에서 받아온 데이터! 즉, 커스텀 제네릭 타입을 사용하고자 하는 부분!
        // 2번째 매개변수에는 new TypeReference< 여기에 어떤 형태로 받을 것인지를 적는다. > () {}
        // 아래 코드 참조!
        List<MenuInfo> menuInfoList = objectMapper.convertValue(orderMap.get("menuList"), new TypeReference<List<MenuInfo>>() {});
        log.info("orderMap.get!! menuInfoList : {}", menuInfoList);

        HttpSession session = request.getSession();

        session.setAttribute("menuInfoList", menuInfoList);
        session.setAttribute("businessNo", businessNo);
        session.setAttribute("discount", discount);

        int totalQuantity = 0;
        int totalPrice = 0;

        if (menuInfoList != null) {
            for (int i = 0; i < menuInfoList.size(); i++) {
                log.info("menuInfos.get(i) - {}", menuInfoList.get(i));
                MenuInfo menuInfo = menuInfoList.get(i);
                totalPrice += menuInfo.getMenuPrice();
                totalQuantity += menuInfo.getQuantity();
            }
        }

        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("totalQuantity", totalQuantity);


        return "order-success"; // -> 확인창에서 최종 주문 요청을 하게 되면 KakaoController에서 작업 수행.
    }


    @GetMapping("/kakao/order/check/request")
    public String hey(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        List<MenuInfo> menuInfoList = (List<MenuInfo>) session.getAttribute("menuInfoList");
        log.info("/kakao/order/check GET!! - {}", menuInfoList);

        String referer = request.getHeader("Referer");
        model.addAttribute("referer", referer);


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
