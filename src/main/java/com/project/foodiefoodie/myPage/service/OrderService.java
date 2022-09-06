package com.project.foodiefoodie.myPage.service;

import com.project.foodiefoodie.myPage.dto.MenuAndEaDTO;
import com.project.foodiefoodie.myPage.dto.OrderNoAndStoreNameDTO;
import com.project.foodiefoodie.myPage.dto.OrdersDTO;
import com.project.foodiefoodie.myPage.repository.OrderMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderService {


    private final OrderMapper orderMapper;


    // 메뉴 합쳐서 나오는 문자열
    public String sumNoMenuAndEa(int orderNo) {
        String sumString = "";
        List<MenuAndEaDTO> menuAndEaDTO = orderMapper.findMenuAndEaDTO(orderNo);
        for (MenuAndEaDTO andEaDTO : menuAndEaDTO) {
            sumString += andEaDTO.getOrderMenu() + andEaDTO.getMenuEa() + "개, ";
        }
        return sumString;

    }

    // 주문 1건당 총 금액
    public int sumMoneyTotal(int orderNo) {
        int i = orderMapper.orderSum(orderNo);
        return i;
    }

    // 내가 필요한것만 나오게함
    public List<OrdersDTO> OrderNeedList(String businessNo) {
        List<OrdersDTO> orderNeedList = orderMapper.findOrderNeedList(businessNo);
        return orderNeedList;
    }

    // 마스터에 주문 갯수 가져옴  // 포문돌릴때 쓸꺼임
    public int masterOrderCount(String businessNo) {
        int i = orderMapper.listCount(businessNo);
        return i;
    }

    // 주문한 가게 이름
    public List<OrderNoAndStoreNameDTO> OrderNoAndStoreNameList(String email){
        List<OrderNoAndStoreNameDTO> orderNoAndStoreNameDTOS = orderMapper.OrderNoAndStoreNameDTOList(email);
        return orderNoAndStoreNameDTOS;
    }


    // 주문번호에 할인율 받아오기
    public int discountRate(int orderNum){
        int discount = orderMapper.discount(orderNum);
        return discount;
    }



}
