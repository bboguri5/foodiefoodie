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


    @GetMapping("/masterOrderList/{masterNum}")
    public String masterOrderList(@PathVariable int masterNum , HttpSession session, Model model){
        Member loginUser = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();
        log.info("welcome /masterInfo -loginUser-Auth : {}",loginUser.getAuth());
        log.info("email {} ",email);
        List<Master> masters = masterService.allMaster(email);
        Master master = masters.get(masterNum); //정상작동
        log.info("master BuNo  == {}, master storeName == {} ",master.getBusinessNo(),master.getStoreName());
        // 비즈니스 번호를 찾아야 그에 맞는 값을 반환해줄수 있다
        String businessNo = master.getBusinessNo();

        // 포문 돌리기 위한 총 길이 갯수
        int num = orderService.masterOrderCount(businessNo);
        //빼올 것들 orderList 테이블에서 필요한것만 추린것들
        List<OrdersDTO> ordersDTOS = orderService.OrderNeedList(businessNo);

        log.info("ordersDTOS.size() ======{}",ordersDTOS.size());

        int size = ordersDTOS.size();

        // 데이트타입 , 날짜 변환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        // 최종적으로 넘겨줘야할 리스트
        ArrayList<MasterOrderListDTO> masterOrderListDTOS = new ArrayList<>();

        for (int i = 0; i <size ; i++) {
            OrdersDTO ordersDTO = ordersDTOS.get(i);
             // 새로 넣어줄 MasterOrderListDTO 객세 생성
            MasterOrderListDTO masterOrderListDTO = new MasterOrderListDTO();

            // 1. 주문번호 넣어주기
            masterOrderListDTO.setOrderNo(ordersDTO.getOrderNo());
            // 2. 이메일 넣어주기
            masterOrderListDTO.setEmail(ordersDTO.getEmail());
            // 3. 주문 내역 스트링으로 반환한거 넣어주기
            masterOrderListDTO.setOrderMenuList(orderService.sumNoMenuAndEa(ordersDTO.getOrderNo()));
            // 4. 주문 총 금액 가져오기
            masterOrderListDTO.setTotalNum(orderService.sumMoneyTotal(ordersDTO.getOrderNo()));
            // date 를 스트링으로 변환
            String format = sdf.format(ordersDTO.getOrderDate());
            // 5. 변환한 날짜 넣기
            masterOrderListDTO.setDateAndTime(format);
            // 6. 값 세팅한거 리스트에 넣어주기
            masterOrderListDTOS.add(masterOrderListDTO);
        }


        model.addAttribute("masterOrderList",masterOrderListDTOS);

        return "/myPage/masterOrderList";
    }



    @GetMapping("/userOrderList")
    public String userOrderList(HttpSession session,Model model){
        Member loginUser = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();
        // 반쪽자리 데이터
        List<OrderNoAndStoreNameDTO> orderNoAndStoreNameDTOS = orderService.OrderNoAndStoreNameList(email);
        int size = orderNoAndStoreNameDTOS.size();

        // 모델에 담아서 줄 리스트 !
        ArrayList<UserOrderListDTO> userOrderListDTOS = new ArrayList<>();


        // 날짜 변환할 폼 데이터
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        for (int i = 0; i <size ; i++) {
            OrderNoAndStoreNameDTO orderNoAndStoreNameDTO = orderNoAndStoreNameDTOS.get(i);
            UserOrderListDTO userOrderListDTO = new UserOrderListDTO();
            // 주문번호 넣기
            userOrderListDTO.setOrderNo(orderNoAndStoreNameDTO.getOrderNo());
            // 가게이름 넣기
            userOrderListDTO.setStoreName(orderNoAndStoreNameDTO.getStoreName());
            // 주문내역 넣기 ( 떡꼬치 1개 , 닭꼬치 1개 )
            userOrderListDTO.setOrderMenuList(orderService.sumNoMenuAndEa(orderNoAndStoreNameDTO.getOrderNo()));
            // 주문 금액 넣기
            userOrderListDTO.setTotalNum(orderService.sumMoneyTotal(orderNoAndStoreNameDTO.getOrderNo()));
            // 날짜 변환해서 넣기
            String format = sdf.format(orderNoAndStoreNameDTO.getOrderDate());
            userOrderListDTO.setOrderDate(format);

            // 넣은 값들을 리스트에 넣기
            userOrderListDTOS.add(userOrderListDTO);
        }

        // 리스트 모델이 넣어주기
        model.addAttribute("userOrderList",userOrderListDTOS);

        return "/myPage/userOrderList";
    }

}
