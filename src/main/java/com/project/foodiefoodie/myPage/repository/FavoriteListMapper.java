package com.project.foodiefoodie.myPage.repository;


import com.project.foodiefoodie.myPage.dto.FavoriteStoreInfoDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteStorePromotionBnoListDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteFileDataDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavoriteListMapper {


        // 즐겨찾기한 가게 프로모션 번호  리스트 가져옴
    List<FavoriteStorePromotionBnoListDTO> favoriteStorePromotionBnoList(String email);

    // 가게의 메인 사진을 가져오는 메서드
    FavoriteFileDataDTO favoriteFileData(int promotionBno);


    // 홍보글 번호로 , 가게 정보 가져옴

    FavoriteStoreInfoDTO favoriteStoreInfo(int promotionBno);









}
