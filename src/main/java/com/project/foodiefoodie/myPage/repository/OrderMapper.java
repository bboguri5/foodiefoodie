package com.project.foodiefoodie.myPage.repository;


import com.project.foodiefoodie.myPage.domain.OrderDetail;
import com.project.foodiefoodie.myPage.domain.Orders;
import com.project.foodiefoodie.myPage.dto.MenuAndEaDTO;
import com.project.foodiefoodie.myPage.dto.OrderNoAndStoreNameDTO;
import com.project.foodiefoodie.myPage.dto.OrdersDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {



    // 주문 목록 가져오는놈
    List<Orders> findOrderList(String businessNo);

    // 주문 갯수 가져오기
    int listCount(String businessNo);


    // 주문 내역 가져오는놈
    List<OrderDetail> findOrderDetailList(int orderNum);

    // 주문내역 이름과 수량만 가져오기
    List<MenuAndEaDTO> findMenuAndEaDTO(int orderNum);

    //주문별 총 금액 가져오기
    int orderSum(int orderNum);

    // orderList에서 필요한 정보만 가져옴
    List<OrdersDTO> findOrderNeedList(String businessNo);

    // 내 주문번호 , 및 가게이름
    List<OrderNoAndStoreNameDTO> OrderNoAndStoreNameDTOList(String email);







}
