package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.*;
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

//
    private final MyPageService myPageService;

    private final ReviewBoardService reviewBoardService;

    private final ReplyService replyService;

    private final ReviewService reviewService;

//    private final MyReviewDTO reviewDTO;


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

        int totalReplyCount = 0;

        int totalLikeCount = 0;

        int totalMyReviewCount = size;

        for (int i = 0; i <size ; i++) {

            // 담을 객체를 생성한다
            ReviewLikeReplyPictureDTO reviewLikeReplyPictureDTO = new ReviewLikeReplyPictureDTO();
            // 파일 담기
            reviewLikeReplyPictureDTO.setFileData(strings.get(i));

            // 리뷰당 좋아요 갯수 구하기
            int likeCount = reviewService.reviewLikeCount(reviewNumDTOS.get(i).getReviewBno());
            // 토탈카운트에 더하기
            totalLikeCount += likeCount;

            // 리뷰 좋아요 갯수 담기
            reviewLikeReplyPictureDTO.setLikeCnt(likeCount);

            // 리뷰글 당 댓글 갯수 구하기
            int countReply = replyService.CountReply(reviewNumDTOS.get(i).getReviewBno());

            // 총 댓글수에다가 , 리뷰글당 댓글수 더하기
            totalReplyCount += countReply;

            // 리뷰 댓글 갯수 담기
            reviewLikeReplyPictureDTO.setReplyCount(countReply);


            // 리뷰 글 번호 담기
            reviewLikeReplyPictureDTO.setReviewBno(reviewNumDTOS.get(i).getReviewBno());

            //

            // 세팅한 객체를 리스트에 담아준다
            reviewLikeReplyPictureDTOS.add(reviewLikeReplyPictureDTO);


        }


        model.addAttribute("myReviewList",reviewLikeReplyPictureDTOS);
        model.addAttribute("totalReplyCount",totalReplyCount); // 댓글 총 갯수
        model.addAttribute("totalLikeCount",totalLikeCount); // 좋아요 총 갯수
        model.addAttribute("totalMyReviewCount",totalMyReviewCount);


        return "/myPage/myPage-myReview";
    }


}
