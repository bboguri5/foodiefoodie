package com.project.foodiefoodie.common.api.payment.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
    
    void insertOrderList(String email, String businessNo);

    int findCurrentOrderNo(String email, String businessNo);

    void insertOrderDetail(int orderNo, String menu, int quantity, int price);
}
