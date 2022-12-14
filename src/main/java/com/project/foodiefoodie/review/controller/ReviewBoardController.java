package com.project.foodiefoodie.review.controller;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.service.ProBoardService;
import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.service.ReplyFaqService;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import com.project.foodiefoodie.reviewFaq.service.ReviewFaqService;
import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardController {

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;
    private final MasterService masterService;
    private final ReviewFaqService reviewFaqService;
    private final ReplyFaqService replyFaqService;

    private final ProBoardService proBoardService;

    private static final String RECEIPT_UPLOAD_PATH = "/home/ec2-user/foodiefoodie/receipt";
//    private static final String RECEIPT_UPLOAD_PATH = "C:\\foodiefoodie\\receipt";

    @GetMapping("/review")
    public String review(String sort, Model model, HttpSession session) {
        log.info("review started - list");

        List<ReviewBoardDTO> reviewList = reviewBoardService.findAllReviewsService(sort);
        List<String> reviewUploads = new ArrayList<>();
        List<Integer> replyCount = new ArrayList<>();

        Member loginUser = (Member) session.getAttribute("loginUser");

        String email = "";
        if (loginUser != null) {
            email = loginUser.getEmail();
        }


        List<Long> isLikedList = reviewBoardService.getLikedListService(email);
        // ????????? ?????? ?????? ????????? ????????????
        getUploads(reviewUploads, replyCount, reviewList);
//        log.info("reviewUploads - {}", reviewUploads);
//        log.info("replyCount - {}", replyCount);
//        log.info("reviewList - {}", reviewList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyCount", replyCount);
        model.addAttribute("isLikedList", isLikedList);

        return "review/review-gram";
    }

    private void getUploads(List<String> reviewUploads, List<Integer> replyCount, List<ReviewBoardDTO> reviewList) {
        log.info("getUploads - {}, {}, {}", reviewUploads, replyCount, reviewList);
        for (int i = 0; i < reviewList.size(); i++) {
            long reviewBno = reviewList.get(i).getReviewBno();
            log.info("getUploads - reviewBno - {}", reviewBno);
            List<ReviewUpload> reviewUpload = reviewBoardService.findReviewUpload(reviewBno);
//            log.info("reviewUploadBase64 - {}", reviewUpload);
            int count = replyService.findReplyCountService(reviewBno);

            if (!reviewUpload.isEmpty()) {
                reviewUploads.add(reviewUpload.get(0).getFileData());
                log.info("reviewUpload.get(0).getFileData() - {}", reviewUpload.get(0).getFilePath());
            } else {
                reviewUploads.add(null);
            }

            replyCount.add(count);
        }
    }

    @GetMapping("/review/detail")
    public String reviewDetail(long reviewBno, Model model, HttpSession session) {
        log.info("review/detail GET!!!");
        ReviewBoardDTO review = reviewBoardService.findOneReviewService(reviewBno);
        List<ReviewUpload> reviewUploads = reviewBoardService.findReviewUpload(reviewBno);
        List<Reply> replyList = replyService.findAllRepliesService(reviewBno);
//        log.info("review - {}", review);
        List<String> reviewUpload = new ArrayList<>();
        for (ReviewUpload upload : reviewUploads) {
            reviewUpload.add(upload.getFileData());
        }

        Member loginUser = (Member) session.getAttribute("loginUser");

        String email = "";
        if (loginUser != null) {
            email = loginUser.getEmail();
        }

        model.addAttribute("review", review);
        model.addAttribute("uploads", reviewUpload);
        model.addAttribute("replyList", replyList);
        model.addAttribute("replyCount", replyService.findReplyCountService(reviewBno));
        model.addAttribute("isLiked", reviewBoardService.isLikedService(reviewBno, email));
        log.info("replyList - {}", replyList);
        return "review/review-detail";
    }

    @GetMapping("/review/search")
    public String searchReview(HttpServletRequest request, String search, String sort, Model model) {
        List<ReviewBoardDTO> searchList = reviewBoardService.searchAllReviewService(search, sort);
        List<String> reviewUploads = new ArrayList<>();
        List<Integer> replyCount = new ArrayList<>();

        String beforeUrl = request.getHeader("REFERER");

        // ????????? ?????? ?????? ????????? ????????????
        getUploads(reviewUploads, replyCount, searchList);
        model.addAttribute("reviewList", searchList);
        model.addAttribute("uploads", reviewUploads);
        model.addAttribute("replyCount", replyCount);
        if (!beforeUrl.contains("proBoard/detail")) // ?????? ???????????? detail ??? ?????? ?????? ?????? ?????? X
            model.addAttribute("search", search);
        return "review/review-gram";
    }


    @GetMapping("/review/write")
    public String reviewWrite(HttpSession session, Model model) {
//        log.info("review/write GET! - ");
        Member loginUser = (Member) session.getAttribute("loginUser");
        model.addAttribute("email",loginUser.getEmail());
        return "review/review-write";
    }

    @GetMapping("/review/write/{businessNo}")
    public String reviewWriteForBusinessNo(Model model, @PathVariable String businessNo, HttpSession session, HttpServletRequest request) {
//        log.info("review/write/{} GET! - ", businessNo);

        Master master = masterService.findOneForBusinessNoService(businessNo);
        Member loginUser = (Member) session.getAttribute("loginUser");
        String referer = request.getHeader("Referer");
        if(referer != null) {
            if (referer.contains("proBoard/detail")) {
                model.addAttribute("referer", referer);
            } else {
                model.addAttribute("referer", null);
            }
        }
        log.info("referer - {}", referer);
        model.addAttribute("master", master);
        model.addAttribute("loginUser", loginUser);
//        log.info("loginUser - {}", loginUser);
//        log.info(master);

        return "review/review-write";
    }


    @PostMapping("/review/write")
    public String reviewWriteUpload(ReviewBoard review, List<MultipartFile> reviewImgFile, HttpSession session) {

        log.info("review - {}", review.getEmail());
        log.info("receipt- {}", review.getReceipt());

        boolean result = reviewBoardService.saveService(review, reviewImgFile);

//        log.info("result - {}", result);

        Member loginUser = (Member) session.getAttribute("loginUser");
        deleteReceiptFiles();
        return "redirect:/review?sort=latest";
    }

    private void deleteReceiptFiles()
    {
        String path = RECEIPT_UPLOAD_PATH;
//        String path = "C:\\foodiefoodie\\receipt";

        File folder = new File(path);
        try {
            while(folder.exists()) {
                File[] folder_list = folder.listFiles(); //??????????????? ????????????

                for (int j = 0; j < folder_list.length; j++) {
                    folder_list[j].delete(); //?????? ??????
                }

                if(folder_list.length == 0 && folder.isDirectory()){
                    folder.delete(); //???????????? ??????
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    @PostMapping("/review/write/receipt") // ????????? ?????? ?????????
    @ResponseBody
    public String checkReceipt(@RequestBody MultipartFile file) {
        if (file.getSize() == 0) return null;

        String path = RECEIPT_UPLOAD_PATH;
//        String path = "C:\\foodiefoodie\\receipt";


        String uploadFile = FoodieFileUtils.uploadFile(file, path);
        String registeredBusiness = reviewBoardService.getRegisteredBusiness(uploadFile); //return ????????? ??????

        log.info("/review/write/receipt checkReceipt - {}", registeredBusiness);


        return registeredBusiness != null ? registeredBusiness : "false";
    }

    @PostMapping("/review/write/master/upload/receipt") // ????????? ?????? ?????????
    @ResponseBody
    public String checkUploadReceipt(@RequestBody MultipartFile file) {

        if (file.getSize() == 0) return null;
        String path = RECEIPT_UPLOAD_PATH;
//        String path = "C:\\foodiefoodie\\receipt";

        String uploadFile = FoodieFileUtils.uploadFile(file, path);

        File filePath = new File(uploadFile);

        log.info("/review/write/master/receipt checkMasterReceipt - {}", filePath.getName());

        return filePath.getName();
    }

    @PostMapping("/review/write/master/receipt") // ????????? ?????? ?????????
    @ResponseBody
    public String checkMasterReceipt(@RequestBody Map<String,Object> sendObj2) {

        String fileName = (String) sendObj2.get("fileName");
        String businessNo = (String) sendObj2.get("businessNo");

        String path = RECEIPT_UPLOAD_PATH + File.separator + fileName;
//        String path = "C:\\foodiefoodie\\receipt" + File.separator + fileName;

        String registeredBusiness = reviewBoardService.getRegisteredMasterBusiness(path,businessNo);

        log.info("/review/write/receipt checkReceipt - {}", registeredBusiness);


        return registeredBusiness;
    }


    @GetMapping("review/write/master/{businessNo}") // ????????? ????????? ?????? ?????? ?????? ??????
    @ResponseBody
    public Map<String, ProBoard> getMaster(@PathVariable String businessNo) {

        log.info("review/write/master/{businessNo} getMaster - {}", businessNo);
        Map<String, ProBoard> infoMap = new HashMap<>();
        ProBoard proBoard = proBoardService.selectProBoardBusiness(businessNo);
        infoMap.put("proBoard", proBoard);
        log.info(" review/write/master/{businessNo}- {}", proBoard);

        return infoMap;
    }

    @PostMapping("review/write/is/master")
    @ResponseBody
    public String isMaster(@RequestBody Map<String, Object> values){
        boolean master = reviewBoardService.isMaster((String) values.get("email"), (String) values.get("businessNo"));

        log.info(" review/write/is/master isMaster {}",master);
        return master ? "Y" : "N";
    }

    // ?????? - ??????
    @GetMapping("/review/modify/{reviewBno}")
    public String reviewModify(@PathVariable Long reviewBno, Model model) {

//        log.info("/review/modify GET! - {}", reviewBno);

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

    // ?????? - ??????
    @GetMapping("/review/modify/page/fileImg/{reviewBno}")
    @ResponseBody
    public List<ReviewUpload> modifyPageFileImg(@PathVariable Long reviewBno, Model model) {

//        log.info("/review/modify GET! - {}", reviewBno);

        List<ReviewUpload> reviewUpload = reviewBoardService.findReviewUpload(reviewBno);


        return reviewUpload;
    }


    @PostMapping("/review/modify")
    public String reviewModifyData(ReviewBoard reviewBoard, List<MultipartFile> reviewImgFile, HttpSession session) {

        log.info("/review/modify POST! - {}", reviewBoard);

        Member loginUser = (Member) session.getAttribute("loginUser");

        boolean flag = reviewBoardService.modifyReview(reviewBoard, reviewImgFile);

        return "redirect:/review/detail?reviewBno=" + reviewBoard.getReviewBno();
    }

    @PostMapping("/review/remove")
    public String reviewRemove(Long reviewBno, String businessNo) {
        log.info("/review/remove POST!!!!! - {}", reviewBno);
        log.info("/review/remove POST!!!!! - {}", businessNo);

        reviewBoardService.removeReviewService(reviewBno, businessNo);

        return "redirect:/review?sort=latest";
    }

    @PostMapping("/review/review-faq")
    public String reviewFaq(ReviewFaq reviewFaq) {

        log.info("/review/review-faq POST!!!! - {}", reviewFaq);

        reviewFaqService.saveService(reviewFaq);


        return "redirect:/review/detail?reviewBno=" + reviewFaq.getReviewBno();
    }

    @PostMapping("/review/reply-faq")
    public String replyFaq(ReplyFaq replyFaq, long reviewBno) {

        log.info("/review/reply-faq POST!!!!! - {}", replyFaq);


        replyFaqService.saveService(replyFaq);

        return "redirect:/review/detail?reviewBno=" + reviewBno;
    }


}
