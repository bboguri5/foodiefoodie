package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.FavoriteListDTO;
import com.project.foodiefoodie.member.service.FavoriteListService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MyPageController {




    private final FavoriteListService favoriteListService;


    @GetMapping("/favoriteList")
    public String favoriteListDTOList(HttpSession session , Model model){
        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        // 로그인한 유저를 잡아서 그 사람이 가지고있는 즐겨찾기 목록을 가져옴 !
        log.info("userEmail {} ", member.getEmail());

        List<FavoriteListDTO> favoriteListDTOS = favoriteListService.favoriteListService(member.getEmail().trim());

        // 잡아온 리스트를 모달에 담아서 줌
        model.addAttribute("favorites",favoriteListDTOS);
        return "/myPage/favoriteList";
    }

    @GetMapping("/passwordModal")
    public String passwordModal(){
        log.info("passwordModal");
        return "/myPage/passwordModal";
    }


}
