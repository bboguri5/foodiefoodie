package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.dto.FavoriteFileDataDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteStorePromotionBnoListDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


@SpringBootTest
class favoriteListMapperTest {

    @Autowired
    FavoriteListMapper favoriteListMapper;

    @Test
    @DisplayName("이메일 주면 , 즐겨찾기 리스트 번호로  줌 ")
    void comeListTest(){

        String email = "ccc@nate.com";
        List<FavoriteStorePromotionBnoListDTO> favoriteStorePromotionBnoListDTOS = favoriteListMapper.favoriteStorePromotionBnoList(email);

        System.out.println("\n\n=====\n\n");
        System.out.println(favoriteStorePromotionBnoListDTOS.size());
        for (FavoriteStorePromotionBnoListDTO favoriteStorePromotionBnoListDTO : favoriteStorePromotionBnoListDTOS) {
            System.out.println(favoriteStorePromotionBnoListDTO);
        }
        System.out.println("\n\n=====\n\n");

    }

    @Test
    @DisplayName("번호 주면 파일 데이터 나옴 ")
    void favoriteFileDataTest(){
        int promoBno = 23 ;
        FavoriteFileDataDTO favoriteFileDataDTO = favoriteListMapper.favoriteFileData(promoBno);
        System.out.println("\n\n=====\n\n");
        System.out.println(favoriteFileDataDTO.getFileData());
        System.out.println("\n\n=====\n\n");
    }








}