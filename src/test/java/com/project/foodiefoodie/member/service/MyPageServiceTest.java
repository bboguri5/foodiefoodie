package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.dto.MyReviewPathDTO;
import com.project.foodiefoodie.member.dto.MyReviewTitleDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


@SpringBootTest
class MyPageServiceTest {


    @Autowired
    MyPageService myPageService;

    @Test
    @DisplayName("리스트 제목, 내용 줄여서 나옴 ")
    void titleServiceTest(){
        String email = "soslimso@nate.com";

        List<MyReviewTitleDTO> titleListService = myPageService.findTitleListService(email);
        for (MyReviewTitleDTO titleDTO : titleListService) {
            String title = titleDTO.getTitle();
            String content = titleDTO.getContent();
            int reviewBno = titleDTO.getReviewBno();
            System.out.println("reviewBno = " + reviewBno + title + content );
//            여기를 꼭...감자탕 맛...
//            수산시장에...대왕 문어...
//            노량진 가...활어 맛집...
//            홍대 클럽...타코야키 ...
//            상수동에 ...라멘맛집....
             // 이렇게 줄여서 잘 나옴

        }

    }

    @Test
    @DisplayName("리뷰 번호를 받아서 경로가 나옴 ")
    void findPathListServiceTest(){
        String email = "soslimso@nate.com";

        Map<Integer, MyReviewPathDTO> pathListService = myPageService.findPathListService(email);

        Set<Map.Entry<Integer, MyReviewPathDTO>> entries = pathListService.entrySet();
        for (Map.Entry<Integer, MyReviewPathDTO> entry : entries) {
            System.out.println(entry.getKey() + "  :  " +entry.getValue());
        }


    }


}