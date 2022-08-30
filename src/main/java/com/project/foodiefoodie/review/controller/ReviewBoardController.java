package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterAndMemberService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.domain.Review;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardController {

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;
    private final MasterService masterService;
    @GetMapping("/review")
    public String review(String sort, Model model) {
        log.info("review started - list");

        List<ReviewBoardDTO> reviewList = reviewBoardService.findAllReviewsService(sort);
        List<String> reviewUploads = new ArrayList<>();
        List<Integer> replyCount = new ArrayList<>();

        // 첫번째 리뷰 사진 리스트 모아오기
        getUploads(reviewUploads, replyCount, reviewList);
//        log.info("reviewUploads - {}", reviewUploads);
//        log.info("replyCount - {}", replyCount);
//        log.info("reviewList - {}", reviewList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyCount", replyCount);

        return "review/review-gram";
    }

    private void getUploads(List<String> reviewUploads, List<Integer> replyCount, List<ReviewBoardDTO> reviewList) {
        for (int i = 0; i < reviewList.size(); i++) {
            long reviewBno = reviewList.get(i).getReviewBno();
            List<String> reviewUpload = reviewBoardService.findReviewUploadsForByteService(reviewBno);
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
    public String reviewDetail(long reviewBno, String email, Model model) {
        ReviewBoardDTO review = reviewBoardService.findOneReviewService(reviewBno);
        List<String> reviewUploads = reviewBoardService.findReviewUploadsForByteService(reviewBno);
        List<Reply> replyList = replyService.findAllRepliesService(reviewBno);
        log.info("review - {}", review);

        model.addAttribute("review", review);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyList", replyList);
        model.addAttribute("replyCount", replyService.findReplyCountService(reviewBno));
        model.addAttribute("isLiked", reviewBoardService.isLikedService(reviewBno, email));
        return "review/review-detail";
    }

    @GetMapping("/review/search")
    public String searchReview(String search, String sort, Model model) {
        List<ReviewBoardDTO> searchList = reviewBoardService.searchAllReviewService(search, sort);
        List<String> reviewUploads = new ArrayList<>();
        List<Integer> replyCount = new ArrayList<>();

        // 첫번째 리뷰 사진 리스트 모아오기
        getUploads(reviewUploads, replyCount, searchList);
        model.addAttribute("reviewList", searchList);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyCount", replyCount);
        model.addAttribute("search", search);
        return "review/review-gram";
    }


    @GetMapping("/review/write")
    public String reviewWrite(Model model) {
//        log.info("review/write GET! - ");

        return "review/review-write";
    }

    @GetMapping("/review/write/{businessNo}")
    public String reviewWriteForBusinessNo(Model model, @PathVariable String businessNo, HttpSession session) {
//        log.info("review/write/{} GET! - ", businessNo);

        Master master = masterService.findOneForBusinessNoService(businessNo);
        Member loginUser = (Member) session.getAttribute("loginUser");

        model.addAttribute("master", master);
        model.addAttribute("loginUser", loginUser);
//        log.info("loginUser - {}", loginUser);
//        log.info(master);

        return "review/review-write";
    }


    @PostMapping("/review/write")
    public String reviewWriteUpload(ReviewBoard review, List<MultipartFile> reviewImgFile) {

        log.info("review - {}", review);
        boolean result = reviewBoardService.saveService(review, reviewImgFile);



        return "redirect:/review";
    }

    // 수정 - 정보
    @GetMapping("/review/modify/{reviewBno}")
    public String reviewModify(@PathVariable Long reviewBno, Model model) {

        log.info("/review/modify GET! - {}", reviewBno);

        ReviewBoardDTO reviewBoard = reviewBoardService.findOneReviewService(reviewBno);
//        log.info("reviewBoard - {}", reviewBoard);
        model.addAttribute("review", reviewBoard);
//        List<ReviewUpload> reviewUpload = reviewBoardService.findReviewUpload(reviewBno);
//        ReviewUpload reviewUpload1 = reviewUpload.get(0);
//        log.info("reviewUpload - {}", reviewUpload);
//        log.info("size - {}", reviewUpload.size());
//        model.addAttribute("reviewFile", reviewUpload);
//        model.addAttribute("reviewUpload1", reviewUpload1);


        return "review/review-modify";
    }
    // 수정 - 파일
    @GetMapping("/review/modify/page/fileImg/{reviewBno}")
    @ResponseBody
    public List<ReviewUpload> modifyPageFileImg(@PathVariable Long reviewBno, Model model) {

        log.info("/review/modify GET! - {}", reviewBno);

        List<ReviewUpload> reviewUpload = reviewBoardService.findReviewUpload(reviewBno);



        return reviewUpload;
    }


    @PostMapping("/review/modify")
    public String reviewModifyData(ReviewBoard reviewBoard, List<MultipartFile> reviewImgFile, HttpSession session) {

        log.info("/review/modify POST! - {}", reviewBoard);

        Member loginUser = (Member) session.getAttribute("loginUser");
        boolean flag = reviewBoardService.modifyReview(reviewBoard, reviewImgFile);

        return "redirect:/review/detail?email="+ loginUser.getEmail() + "&reviewBno=" + reviewBoard.getReviewBno();
    }



}
