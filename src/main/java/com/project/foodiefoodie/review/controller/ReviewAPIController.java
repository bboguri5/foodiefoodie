package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.common.api.payment.dto.OrderInfo;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Log4j2
@CrossOrigin
public class ReviewAPIController {

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;


    @PutMapping("/review/updownlike")
    @Transactional
    public String upLike(long reviewBno, String email) {
        log.info("/review/uplike reviewBno - {}, email - {}", reviewBno, email);
        boolean isLiked = reviewBoardService.isLikedService(reviewBno, email);
        if (!isLiked) {
            reviewBoardService.upLikeService(reviewBno);
            reviewBoardService.saveReviewLikeService(reviewBno, email);
            return "up-success";
        } else {
            reviewBoardService.downLikeService(reviewBno);
            reviewBoardService.deleteReviewLikeService(reviewBno, email);
            return "down success";
        }
    }

    @GetMapping("/review/getLike")
    public int getLike(long reviewBno) {
//        log.info("/getLike {}", reviewBno);
        int like = reviewBoardService.getLikeService(reviewBno);
//        log.info("like: {}", like);
        return like;
    }


    @PostMapping("/test")
    public void test(@RequestBody List<OrderInfo> test, @RequestBody String businessNo) {
        log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!! - {}, {}", test, businessNo);
    }
}
