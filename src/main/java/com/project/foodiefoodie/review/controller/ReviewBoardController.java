package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardController {

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;

    @GetMapping("/review")
    public String review(Model model) {

        List<ReviewBoardDTO> reviewList = reviewBoardService.findAllReviewsService();
        model.addAttribute("reviewList", reviewList);

        return "review/review-gram";
    }

    @GetMapping("/review/detail")
    public String reviewDetail(long reviewBno, Model model) {
        ReviewBoardDTO review = reviewBoardService.findOneReviewService(reviewBno);
        List<Reply> replyList = replyService.findAllRepliesService(reviewBno);

        model.addAttribute("review", review);
        model.addAttribute("replyList", replyList);
        return "review/review-detail";
    }


}
