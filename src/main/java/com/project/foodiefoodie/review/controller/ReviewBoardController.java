package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.Getter;
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

    private final ReviewBoardService service;

    @GetMapping("/review")
    public String review(Model model) {

        List<ReviewBoardDTO> reviewList = service.findAllReviewsService();
        model.addAttribute("reviewList", reviewList);

        return "review/review-gram";
    }

    @GetMapping("/review/detail")
    public String reviewDetail(long reviewBno, Model model) {
        ReviewBoardDTO review = service.findOneReviewService(reviewBno);
        model.addAttribute("review", review);
        return "review/review-detail";
    }


}
