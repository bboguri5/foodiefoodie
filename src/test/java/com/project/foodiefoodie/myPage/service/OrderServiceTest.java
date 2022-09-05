package com.project.foodiefoodie.myPage.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class OrderServiceTest {


    @Autowired
    OrderService orderService;


    @Test
    @DisplayName("주문번호 넣으면 주문내역 합쳐서 스트링 하나로 뱉어냄")
    void sumStringTest(){ // 잘나옴
        int num = 1;
        String s = orderService.sumNoMenuAndEa(num);
        System.out.println("\n\n==============\n\n");
        System.out.println(s);
        System.out.println("\n\n==============\n\n");
    }

    @Test
    @DisplayName("주문번호 넣으면 주문내역에서 금액 합쳐서 인트로 뱉어냄")
    void sumMoneyTest(){ // 잘나옴
        int num = 1;
        int i = orderService.sumMoneyTotal(num);
        System.out.println("\n\n==============\n\n");
        System.out.println(i);
        System.out.println("\n\n==============\n\n");
    }
}