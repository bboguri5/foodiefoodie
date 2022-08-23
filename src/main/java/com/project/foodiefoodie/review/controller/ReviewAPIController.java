package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@Log4j2
@CrossOrigin
public class ReviewAPIController {

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;


    @PutMapping("/review/uplike")
    public String upLike(long reviewBno) {
        return reviewBoardService.upLikeService(reviewBno) ? "up-success" : "up-fail";
    }

    @GetMapping("/review/getLike")
    public int getLike(long reviewBno) {
        return reviewBoardService.getLikeService(reviewBno);
    }
}
