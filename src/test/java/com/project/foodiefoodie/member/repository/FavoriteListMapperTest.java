package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.dto.FavoriteListDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FavoriteListMapperTest {

    @Autowired
    private FavoriteListMapper favoriteListMapper;

    @Test
    @DisplayName("이메일을 넣으면 내가 즐겨찾기한 가게 이름 , 등등 나와야 한다 ! ")
    void favoriteListTest(){ // 테스트 통과 !

        List<FavoriteListDTO> favoriteListDTOS = favoriteListMapper.favoriteList("soslimso@nate.com");
        System.out.println(favoriteListDTOS);
        for (FavoriteListDTO dto : favoriteListDTOS) {
            System.out.println("=====================");
            System.out.println(dto.getStoreName());
            System.out.println("=====================");
        }

    }



}