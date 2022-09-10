package com.project.foodiefoodie.myPage.controller;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.myPage.dto.MasterOrderListDTO;
import com.project.foodiefoodie.myPage.dto.OrderNoAndStoreNameDTO;
import com.project.foodiefoodie.myPage.dto.OrdersDTO;
import com.project.foodiefoodie.myPage.dto.UserOrderListDTO;
import com.project.foodiefoodie.myPage.service.OrderService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class OrderController {


    private final OrderService orderService;

    private final MasterService masterService;


    // 마스터 계산
    @GetMapping("/myPage/masterOrderList/{masterNum}")
    public String masterOrderList(@PathVariable int masterNum, HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();
        log.info("welcome /masterInfo -loginUser-Auth : {}", loginUser.getAuth());
        log.info("email {} ", email);
        List<Master> masters = masterService.allMaster(email);
        Master master = masters.get(masterNum); //정상작동
        log.info("master BuNo  == {}, master storeName == {} ", master.getBusinessNo(), master.getStoreName());
        // 비즈니스 번호를 찾아야 그에 맞는 값을 반환해줄수 있다
        String businessNo = master.getBusinessNo();

        // 포문 돌리기 위한 총 길이 갯수
        int num = orderService.masterOrderCount(businessNo);
        //빼올 것들 orderList 테이블에서 필요한것만 추린것들
        List<OrdersDTO> ordersDTOS = orderService.OrderNeedList(businessNo);

        log.info("ordersDTOS.size() ======{}", ordersDTOS.size());

        int size = ordersDTOS.size();

        // 데이트타입 , 날짜 변환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        // 최종적으로 넘겨줘야할 리스트
        ArrayList<MasterOrderListDTO> masterOrderListDTOS = new ArrayList<>();

        for (int i = 0; i < size; i++) {
            OrdersDTO ordersDTO = ordersDTOS.get(i);
            // 새로 넣어줄 MasterOrderListDTO 객세 생성
            MasterOrderListDTO masterOrderListDTO = new MasterOrderListDTO();

            // 1. 주문번호 넣어주기
            int orderNo = ordersDTO.getOrderNo();
            masterOrderListDTO.setOrderNo(orderNo);
            // 2. 이메일 넣어주기
            masterOrderListDTO.setEmail(ordersDTO.getEmail());
            // 3. 주문 내역 스트링으로 반환한거 넣어주기
            String s = orderService.sumNoMenuAndEa(orderNo);
            if (s.length() > 15) {
                // 길이 조절
                String shortString = "";
                String substring = s.substring(0, 10);
                shortString += substring + "...";
                masterOrderListDTO.setOrderMenuList(shortString);
            } else {
                //길이 조절
                masterOrderListDTO.setOrderMenuList(s);
            }
            // 3 - 1 세로로 내역 나온것도 넣어주기
            masterOrderListDTO.setOrderRowMenuList(orderService.sumRowMenuAndEa(orderNo));

            // 4. 주문 총 금액 넣기
            int i1 = orderService.sumMoneyTotal(orderNo);
            masterOrderListDTO.setTotalNum(i1);
            // date 를 스트링으로 변환
            String format = sdf.format(ordersDTO.getOrderDate());
            // 5. 변환한 날짜 넣기
            masterOrderListDTO.setDateAndTime(format);

            // 6. 할인율 넣기
            int i2 = orderService.discountRate(orderNo);
            masterOrderListDTO.setDiscount(i2);

            // 7. 진짜 가격 계산해서 넣어주기

            if (i2 == 0) { // 할인율이 0 이라면 // 총금액을 넣어주고
                log.info("i2 == 0");
                masterOrderListDTO.setRealMoney(i1);
                log.info(" i1 = {}", i1);
            } else if (i2 != 0) { // 할인율이 0 이 아니라면 계산해서 넣어주셈
                log.info("i2 != 0");
                masterOrderListDTO.setRealMoney(i1 - (i1 * i2 / 100));
                log.info("i1 - (i1 * i2/100) === {}", i1 - (i1 * i2 / 100));
            }


            // 8. 값 세팅한거 리스트에 넣어주기
            masterOrderListDTOS.add(masterOrderListDTO);
        }


        model.addAttribute("masterOrderList", masterOrderListDTOS);

        return "/myPage/masterOrderList";
    }


    // 유저 계산
    @GetMapping("/myPage/userOrderList")
    public String userOrderList(HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();

        // 반쪽자리 데이터 // 주문번호 , 가게이름 , 주문시간 - 들어있음
        List<OrderNoAndStoreNameDTO> orderNoAndStoreNameDTOS = orderService.OrderNoAndStoreNameList(email);
        int size = orderNoAndStoreNameDTOS.size();

        // 모델에 담아서 줄 리스트 !
        ArrayList<UserOrderListDTO> userOrderListDTOS = new ArrayList<>();


        // 날짜 변환할 폼 데이터
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        for (int i = 0; i < size; i++) {
            OrderNoAndStoreNameDTO orderNoAndStoreNameDTO = orderNoAndStoreNameDTOS.get(i);
            UserOrderListDTO userOrderListDTO = new UserOrderListDTO();
            // 주문번호 넣기
            int orderNo = orderNoAndStoreNameDTO.getOrderNo();
            userOrderListDTO.setOrderNo(orderNo);

            // 가게이름 넣기
            userOrderListDTO.setStoreName(orderNoAndStoreNameDTO.getStoreName());
            // 주문내역 넣기 ( 떡꼬치 1개 , 닭꼬치 1개 )
            String s = orderService.sumNoMenuAndEa(orderNo);
            if (s.length() > 15) {
                // 길이 조절
                String shortString = "";
                String substring = s.substring(0, 10);
                shortString += substring + "...";
                userOrderListDTO.setOrderMenuList(shortString);
            } else {
                //길이 조절
                userOrderListDTO.setOrderMenuList(s);
            }
            // 3 - 1 세로로 나온 문자열도 넣어주기
            userOrderListDTO.setOrderRowMenuList(orderService.sumRowMenuAndEa(orderNo));

            // 주문 금액 넣기
            int i1 = orderService.sumMoneyTotal(orderNo);
            userOrderListDTO.setTotalNum(i1);
            // 날짜 변환해서 넣기
            String format = sdf.format(orderNoAndStoreNameDTO.getOrderDate());
            userOrderListDTO.setOrderDate(format);

            // 할인율 넣기
            int i2 = orderService.discountRate(orderNo);
            userOrderListDTO.setDiscount(i2);

            log.info("totalSum {} discountRate {}", i1, i2);
            // 계산된 값
            if (i2 == 0) { // 할인율이 0 일때
                log.info("discountRate = 0?");
                userOrderListDTO.setRealMoney(i1);
            } else if (i2 != 0) {
                log.info("discountRate != 0?");
                // 이거까지는 들어오거든 ?
                userOrderListDTO.setRealMoney(i1 - (i1 * i2 / 100));

//                log.info("\n\n=======\n\n");
//                log.info("i1 * i2 == {}",i1 * i2);
//                log.info("i1 * i2 / 100 =={}",i1 * i2 / 100);
//                log.info("i1 - (i1 * i2/100) == {}" ,i1 - (i1 * i2/100));
//
//                log.info("double casting Yes ");
//                log.info("(double)20/100 == {}",(double)20/100); // 0.2
//                log.info("(i1 * (double)i2/100)) == {}",(i1 * (double)i2/100)); // 2000.0
//                log.info("i1-(i1 * (double)i2/100)) == {}",i1 - (i1 * (double)i2/100));
//
//
//                log.info("double casting No ");
//                log.info("20/100 {}" , 20/100);
//                log.info("i1 * (i2/100) = {}",i1 * (i2/100));
//                log.info("realMoney {}",i1 - (i1 * (i2/100)));
            }


            // 넣은 값들을 리스트에 넣기
            userOrderListDTOS.add(userOrderListDTO);
        }

        // 리스트 모델이 넣어주기
        model.addAttribute("userOrderList", userOrderListDTOS);

        return "/myPage/userOrderList";
    }

}
