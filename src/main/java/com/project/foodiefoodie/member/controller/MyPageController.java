package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.*;
import com.project.foodiefoodie.member.service.FavoriteListService;
import com.project.foodiefoodie.member.service.MyPageService;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.dto.ReviewNumDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import com.project.foodiefoodie.review.service.ReviewService;
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

    private final ReviewBoardService reviewBoardService;

    private final ReplyService replyService;

    private final ReviewService reviewService;

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

        // 이메일로 계정의 첫번째 사진을 담은 리스트를 불러온다
        ArrayList<String> strings = reviewBoardService.firstDataList(email);

        // 이메일로 내가 가지고있는 리뷰 번호들을 가져온다 !
        List<ReviewNumDTO> reviewNumDTOS = reviewBoardService.reviewNumList(email);

        // 그것들의 갯수를 구한다
        int size = reviewNumDTOS.size();
        log.info("\n\n========\n\n");
        log.info("size = {}" ,size);
        log.info("\n\n========\n\n");
        // 내가 필요한 정보를 담을 리스트를 만든다
        ArrayList<ReviewLikeReplyPictureDTO> reviewLikeReplyPictureDTOS = new ArrayList<>();

        for (int i = 0; i <size ; i++) {
//            ReviewLikeReplyPictureDTO reviewLikeReplyPictureDTO = reviewLikeReplyPictureDTOS.get(i);

            ReviewLikeReplyPictureDTO reviewLikeReplyPictureDTO = new ReviewLikeReplyPictureDTO();
            // 파일 담기
            reviewLikeReplyPictureDTO.setFileData(strings.get(i));
            log.info("\n\n========\n\n");
            // 리뷰 좋아요 갯수 담기

            reviewLikeReplyPictureDTO.setLikeCnt(reviewService.reviewLikeCount(reviewNumDTOS.get(i).getReviewBno()));

            log.info("reviewService.reviewLikeCount(reviewNumDTOS.get(i).getReviewBno()) = {}",reviewService.reviewLikeCount(reviewNumDTOS.get(i).getReviewBno()));
            // 리뷰 댓글 갯수 담기

            reviewLikeReplyPictureDTO.setReplyCount(replyService.CountReply(reviewNumDTOS.get(i).getReviewBno()));
            log.info("replyService.CountReply(reviewNumDTOS.get(i).getReviewBno()) = {}",replyService.CountReply(reviewNumDTOS.get(i).getReviewBno()));

            log.info("\n\n========\n\n");

            reviewLikeReplyPictureDTOS.add(reviewLikeReplyPictureDTO);


        }



        model.addAttribute("myReviewList",reviewLikeReplyPictureDTOS);


        return "/myPage/myPage-myReview";
    }


}
