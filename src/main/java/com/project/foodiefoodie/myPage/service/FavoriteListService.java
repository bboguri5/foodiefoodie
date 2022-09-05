package com.project.foodiefoodie.myPage.service;


import com.project.foodiefoodie.myPage.dto.FavoriteFileDataDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteStoreInfoDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteStorePromotionBnoListDTO;
import com.project.foodiefoodie.myPage.repository.FavoriteListMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FavoriteListService {

    private final FavoriteListMapper favoriteListMapper;

    // 즐겨찾기한 가게 프로모션 번호  리스트 가져옴
    public List<FavoriteStorePromotionBnoListDTO> favoriteStorePromotionBnoList(String email){
        List<FavoriteStorePromotionBnoListDTO> favoriteStorePromotionBnoListDTOS = favoriteListMapper.favoriteStorePromotionBnoList(email);
        return favoriteStorePromotionBnoListDTOS;
    }

    // 가게의 메인 사진을 가져오는 메서드
    public FavoriteFileDataDTO favoriteFileData(int promotionBno){
        FavoriteFileDataDTO favoriteFileDataDTO = favoriteListMapper.favoriteFileData(promotionBno);
        return favoriteFileDataDTO;
    }

    // 프로모션 번호 주면 , 가게 정보 줌
   public FavoriteStoreInfoDTO favoriteStoreInfo(int promotionBno){
       FavoriteStoreInfoDTO favoriteStoreInfoDTO = favoriteListMapper.favoriteStoreInfo(promotionBno);
       return favoriteStoreInfoDTO;
   }




}
