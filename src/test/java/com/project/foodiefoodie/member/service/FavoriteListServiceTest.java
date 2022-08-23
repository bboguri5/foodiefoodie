package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.dto.FavoriteListDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FavoriteListServiceTest {

    @Autowired
    FavoriteListService service;

    @Test
    @DisplayName("이메일 줄테니까 가지고 나와라 ")
    void favoriteListCome(){
        List<FavoriteListDTO> favoriteListDTOS = service.favoriteListService("soslimso@nate.com");
        for (FavoriteListDTO fafa : favoriteListDTOS) {
            System.out.println(fafa.getStoreName());
        }
    }
}