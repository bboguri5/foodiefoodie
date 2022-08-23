package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardController {

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;

    @GetMapping("/review")
    public String review(Model model) {
        log.info("review started - list");

        List<ReviewBoardDTO> reviewList = reviewBoardService.findAllReviewsService();
        List<ReviewUpload> reviewUploads = new ArrayList<>();
        List<Integer> replyCount = new ArrayList<>();

        // 첫번째 리뷰 사진 리스트 모아오기
        getUploads(reviewUploads, replyCount, reviewList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyCount", replyCount);

        return "review/review-gram";
    }

    private void getUploads(List<ReviewUpload> reviewUploads, List<Integer> replyCount, List<ReviewBoardDTO> reviewList) {
        for (int i = 0; i < reviewList.size(); i++) {
            long reviewBno = reviewList.get(i).getReviewBno();
            List<ReviewUpload> reviewUpload = reviewBoardService.findReviewUploadsService(reviewBno);
            int count = replyService.findReplyCountService(reviewBno);

            if (!reviewUpload.isEmpty()) {
                reviewUploads.add(reviewUpload.get(0));
            } else {
                reviewUploads.add(null);
            }

            replyCount.add(count);
        }
    }

    @GetMapping("/review/detail")
    public String reviewDetail(long reviewBno, Model model) {
        ReviewBoardDTO review = reviewBoardService.findOneReviewService(reviewBno);
        List<ReviewUpload> reviewUploads = reviewBoardService.findReviewUploadsService(reviewBno);
        List<Reply> replyList = replyService.findAllRepliesService(reviewBno);


        model.addAttribute("review", review);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyList", replyList);
        model.addAttribute("replyCount", replyService.findReplyCountService(reviewBno));
        return "review/review-detail";
    }

//    @GetMapping("/review/uplike")
//    public String upLike(long reviewBno) {
//        log.info("uplike started - {}", reviewBno);
//        reviewBoardService.upLikeService(reviewBno);
//        return "redirect:/review";
//    }

}
