package com.project.foodiefoodie.myPage.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.myPage.dto.FavoriteAllInfoDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteFileDataDTO;
import com.project.foodiefoodie.myPage.dto.FavoriteStorePromotionBnoListDTO;
import com.project.foodiefoodie.myPage.service.FavoriteListService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class FavoriteListController {


    private final FavoriteListService favoriteListService;



    @GetMapping("/favoriteList")
    public String favoriteInfoList(HttpSession session , Model model){

        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();

        // 이메일로 내 즐겨찾기 번호 목록을 가져온다
        List<FavoriteStorePromotionBnoListDTO> favoriteStorePromotionBnoListDTOS = favoriteListService.favoriteStorePromotionBnoList(email);
        int size = favoriteStorePromotionBnoListDTOS.size();

        // 결과적으로 이걸 모델에 담아줘야 한다
        ArrayList<FavoriteAllInfoDTO> favoriteAllInfoDTOS = new ArrayList<>();


        for (int i = 0; i <size; i++) {
            // 인덱스를 넣으면 , 프로모션 번호가 나옴
            //favoriteStorePromotionBnoListDTO = 숫자 , 프로모션 번호담은 객체
            FavoriteStorePromotionBnoListDTO favoriteStorePromotionBnoListDTO = favoriteStorePromotionBnoListDTOS.get(i);

            int promotionBno = favoriteStorePromotionBnoListDTO.getPromotionBno();

            // 여기에다가 정보를 담는다
            FavoriteAllInfoDTO favoriteAllInfoDTO = new FavoriteAllInfoDTO();

            // 홍보글 번호 세팅
            favoriteAllInfoDTO.setPromotionBno(promotionBno);
            // 파일데이터 세팅
            FavoriteFileDataDTO favoriteFileDataDTO = favoriteListService.favoriteFileData(promotionBno);
            String fileData = favoriteFileDataDTO.getFileData();
            favoriteAllInfoDTO.setFileData(fileData);














        }

        return "/myPage/favoriteList";
    }

}
