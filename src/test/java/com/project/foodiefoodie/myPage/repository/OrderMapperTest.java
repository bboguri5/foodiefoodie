package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.domain.OrderDetail;
import com.project.foodiefoodie.myPage.domain.Orders;
import com.project.foodiefoodie.myPage.dto.MenuAndEaDTO;
import com.project.foodiefoodie.myPage.dto.OrderNoAndStoreNameDTO;
import com.project.foodiefoodie.myPage.dto.OrdersDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class OrderMapperTest {

//
//    List<Orders> findOrderList(String businessNo);
//
//    // 주문 내역 가져오는놈
//    List<OrderDetail> findOrderDetailList(int orderNum);


    @Autowired
    OrderMapper orderMapper;


    @Test
    @DisplayName("가게 번호 넣으면 주문 리스트 나옴 ")
    void findOrderListTest(){ // 성공
        String buNo = "1234-2222-3333-1124";
        List<Orders> orderList = orderMapper.findOrderList(buNo);
        System.out.println("\n\n=================\n\n\n");
        for (Orders orders : orderList) {
            System.out.println(orders);
        }
        System.out.println("\n\n=================\n\n\n");

    }

    @Test
    @DisplayName("주문 번호 넣으면 합계구해줌")
    void orderSumTest(){ // 성공
        int bno = 1 ;
        int i = orderMapper.orderSum(bno);
        System.out.println("\n\n=================\n\n\n");
        System.out.println(i);
        System.out.println("\n\n=================\n\n\n");

    }

    @Test
    @DisplayName("주문 번호 넣으면 내가 주문한거 내역 나옴 ")
    void findOrderDetailListTest(){ // 성공
        int bno = 1 ;
        List<OrderDetail> orderDetailList = orderMapper.findOrderDetailList(bno);
        System.out.println("\n\n=================\n\n\n");
        for (OrderDetail orderDetail : orderDetailList) {
            System.out.println(orderDetail);
        }
        System.out.println("\n\n=================\n\n\n");


    }

    @Test
    @DisplayName("주문 번호 주면 이름과 갯수 가져옴 ")
    void findMenuAndEaDTOTest(){
        int bno = 1;
        List<MenuAndEaDTO> menuAndEaDTO = orderMapper.findMenuAndEaDTO(1);
        String allMenu= "";
        System.out.println("\n\n=================\n\n\n");
        for (MenuAndEaDTO andEaDTO : menuAndEaDTO) {
            //System.out.println(andEaDTO);
            allMenu += andEaDTO.getOrderMenu() + andEaDTO.getMenuEa() + "개, ";
        }
        System.out.println(allMenu);
        System.out.println("\n\n=================\n\n\n");

    }


    @Test
    @DisplayName("비즈니스 번호 넣으면 ,이메일 ,주문번호 ,날짜 나옴 ")
    void findOrderNeedListTest(){
        String buNo = "1234-2222-3333-1124";
        List<OrdersDTO> orderNeedList = orderMapper.findOrderNeedList(buNo);
        System.out.println("\n\n=================\n\n\n");
        for (OrdersDTO ordersDTO : orderNeedList) {
            System.out.println(ordersDTO);
        }
        System.out.println("\n\n=================\n\n\n");

    }

    @Test
    @DisplayName("비즈니스 넘버 넣으면 주문갯수 나옴 ")
    void orderListCountTest(){
        String buNo = "1234-2222-3333-1124";
        int i = orderMapper.listCount(buNo);
        System.out.println("\n\n=================\n\n\n");
        System.out.println(i);
        System.out.println("\n\n=================\n\n\n");

    }

    @Test
    @DisplayName("이메일 넣으면 내가 주문한 번호 가게 이름 나옴")
    void OrderNoAndStoreNameDTOListTest(){ // 성공
        String email = "soslimso@nate.com";
        List<OrderNoAndStoreNameDTO> orderNoAndStoreNameDTOS = orderMapper.OrderNoAndStoreNameDTOList(email);
        System.out.println("\n\n=================\n\n\n");
        for (OrderNoAndStoreNameDTO orderNoAndStoreNameDTO : orderNoAndStoreNameDTOS) {
            System.out.println(orderNoAndStoreNameDTO);
        }
        System.out.println("\n\n=================\n\n\n");
    }

}