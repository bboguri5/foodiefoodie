package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

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
//        log.info("likeCount - {}", reviewBoardDTO);
//        return "up-fail";
        return reviewBoardService.upLikeService(reviewBno) ? "up-success" : "up-fail";
    }

    @GetMapping("/review/getLike")
    public int getLike(long reviewBno) {
        log.info("/getLike {}", reviewBno);
        int like = reviewBoardService.getLikeService(reviewBno);
        log.info("like: {}", like);
        return like;
    }
}
