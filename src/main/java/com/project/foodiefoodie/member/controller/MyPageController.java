package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.*;
import com.project.foodiefoodie.member.service.FavoriteListService;
import com.project.foodiefoodie.member.service.MyPageService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MyPageController {


    private final FavoriteListService favoriteListService;
//
    private final MyPageService myPageService;

//    private final MyReviewDTO reviewDTO;

    @GetMapping("/favoriteList")
    public String favoriteListDTOList(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        // 로그인한 유저를 잡아서 그 사람이 가지고있는 즐겨찾기 목록을 가져옴 !
        log.info("userEmail {} ", member.getEmail());

        List<FavoriteListDTO> favoriteListDTOS = favoriteListService.favoriteListService(member.getEmail().trim());

        // 잡아온 리스트를 모달에 담아서 줌
        model.addAttribute("favorites", favoriteListDTOS);
        return "/myPage/favoriteList";
    }

    @GetMapping("/passwordModal")
    public String passwordModal() {
        log.info("passwordModal");
        return "/myPage/passwordModal";
    }

    @GetMapping("/myReview")
    public String myReviewList(HttpSession session, Model model) {
        // 여기에 리뷰의 제목, 내용 짧게 , 사진 의 주소를 리턴해야된다 !
        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = member.getEmail();
        // 이메일 을 가져오고
        ArrayList<MyReviewDTO> myReviewDTOS = new ArrayList<>(); // 최종적으로 모델에 들어갈 값
        List<MyReviewTitleDTO> titleListService = myPageService.findTitleListService(email);
        int size = titleListService.size();

        for (int i = 0; i <size ; i++) {
            MyReviewDTO myReviewDTO = new MyReviewDTO();
            List<MyReviewTitleDTO> titleListService1 = myPageService.findTitleListService(email);
            MyReviewTitleDTO titleDTO = titleListService1.get(i);
            log.info("==========================================");
            log.info(" titleDTO : {}" ,titleDTO);
            myReviewDTO.setTitle(titleDTO.getTitle());

            myReviewDTO.setContent(titleDTO.getContent());

            log.info("==========================================");
            // 여기까지는 잘 나온거임..
            HashMap<Integer, MyReviewPathDTO> pathListService = myPageService.findPathListService(email);
            MyReviewPathDTO pathDTO = pathListService.get(titleListService.get(i).getReviewBno());
            log.info("pathDTO : {}",pathDTO);
            myReviewDTO.setFilePath(pathDTO.getFilePath());

            myReviewDTO.setFileName(pathDTO.getFileName());

            myReviewDTOS.add(myReviewDTO);
            log.info("==========================================");
        }
        ProfileDTO profileDTO = myPageService.selectProfile(email);

        model.addAttribute("profile",profileDTO);

        model.addAttribute("reviewInfo",myReviewDTOS);
        return "/myPage/myPage-myReview";
    }


}
