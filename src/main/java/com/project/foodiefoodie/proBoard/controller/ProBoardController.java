package com.project.foodiefoodie.proBoard.controller;


import com.project.foodiefoodie.mainpage.service.MainPageService;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.FileDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.proBoard.dto.NoticeDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import com.project.foodiefoodie.proBoard.service.ProBoardService;

import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.*;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/proBoard")
public class ProBoardController {

    private final ProBoardService proBoardService;
    private final MainPageService mainPageService;
    private final PromotionFaqService promotionFaqService;
    private final MasterService masterService;

    private final ReviewBoardService reviewBoardService;
    private final ReplyService replyService;

    @GetMapping("/detail/{promotionBno}")
    public String detail(Model model, @PathVariable int promotionBno,
                         HttpSession session) {
        log.info(" ProBoardController /detail/{} Get - ! ", promotionBno);

        ProBoard proBoard = proBoardService.selectProBoard(promotionBno);

        model.addAttribute("proBoard", proBoard);
        model.addAttribute("menuList", proBoardService.selectMenuInfo(promotionBno));
        model.addAttribute("detailFiles", proBoardService.selectFiles(promotionBno, "detail"));
        model.addAttribute("titleFile", proBoardService.selectFiles(promotionBno, "title").get(0));
        model.addAttribute("noticeDTOS", proBoardService.selectNotice(promotionBno));
        model.addAttribute("isHotDeal", proBoardService.isHotDealService(proBoardService.selectProBoard(promotionBno).getBusinessNo()));
        model.addAttribute("isOpen", mainPageService.isOpenService(promotionBno));

        // 로그인 하면 즐겨찾기 표시 , 로그인 안하면 즐겨찾기 표시 X
        String loginFlag = LoginUtils.LOGIN_FLAG;
        Member member = (Member) session.getAttribute(loginFlag);
        List<String> reviewUploads = new ArrayList<>();
        List<Integer> replyCount = new ArrayList<>();

        // 공지사항 마스터만 작성 및 삭제
        if (member != null) {
            model.addAttribute("masterFlag", proBoard.getEmail().equals(member.getEmail()));
            model.addAttribute("isFavorite", proBoardService.isFavoriteStore(member.getEmail(), promotionBno));
            model.addAttribute("flag", true);
        } else {
            model.addAttribute("flag", false);
        }

        // 리뷰
        List<ReviewBoardDTO> reviewList = reviewBoardService.searchTop5ReviewService(proBoard.getBusinessNo(), "latest");

        getUploads(reviewUploads, replyCount, reviewList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("uploads", reviewUploads);
        return "promotion/pro-detail";
    }

    private void getUploads(List<String> reviewUploads, List<Integer> replyCount, List<ReviewBoardDTO> reviewList) {
        for (int i = 0; i < reviewList.size(); i++) {
            long reviewBno = reviewList.get(i).getReviewBno();
            List<ReviewUpload> reviewUpload = reviewBoardService.findReviewUpload(reviewBno);
            int count = replyService.findReplyCountService(reviewBno);

            if (!reviewUpload.isEmpty()) {
                log.info("reviewUploadFileData - {}", reviewUpload.get(0).getFileData());
                reviewUploads.add(reviewUpload.get(0).getFileData());
            } else {
                reviewUploads.add(null);
            }
            replyCount.add(count);
        }
    }

    @GetMapping("/detail/notice/show/{promotionBno}")
    @ResponseBody
    public List<NoticeDTO> showAgainDetailNotice(@PathVariable int promotionBno) {
        List<NoticeDTO> noticeDTOS = proBoardService.selectNotice(promotionBno);
        log.info("ProBoardController /detail/noticeShow/{} Get - ! noticeDOTS : {} ", promotionBno, noticeDTOS);
        return noticeDTOS;
    }


    @PostMapping("/detail/notice/save")
    @ResponseBody
    public String saveDetailNotice(@RequestBody NoticeDTO noticeDTO) {
        log.info("ProBoardController /detail/noticeSave POST - ! {}", noticeDTO);
        boolean result = proBoardService.saveNotice(noticeDTO);
        return result ? "insert-success" : "insert-failed";
    }

    @DeleteMapping("/detail/notice/delete/{noticeNo}")
    @ResponseBody
    public String deleteDetailNotice(@PathVariable int noticeNo) {
        log.info("/detail/noticeDelete/{} controller RequestBody ", noticeNo);
        boolean result = proBoardService.deleteNotice(noticeNo);
        return result ? "delete-success" : "delete-failed";
    }

    @GetMapping("/detail/favorite/store/add/{promotionBno}")
    @ResponseBody
    public String addFavoriteStore(HttpSession session, @PathVariable int promotionBno) {
        log.info(" /detail/favorite/store/add - {}", promotionBno);
        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        proBoardService.addFavoriteStore(member.getEmail(), promotionBno);
        return "";
    }

    @DeleteMapping("/detail/favorite/store/remove/{promotionBno}")
    @ResponseBody
    public String removeFavoriteStore(HttpSession session, @PathVariable int promotionBno) {
        log.info(" /detail/favorite/store/remove - {}", promotionBno);

        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        proBoardService.removeFavoriteStore(member.getEmail(), promotionBno);
        return "";
    }


    //    ---------------------------------------- write ----------------------------------------
    @GetMapping("/write/{businessNo}")
    public String write(HttpSession session, Model model, @PathVariable String businessNo) {

//        로그인 X , 관리자 X 일 경우 접근 불가.
//        if(!(LoginUtils.isLogin(session) && LoginUtils.getCurrentMemberAuth(session) == "MASTER"))
//        {
//            return "redirect:/login";
//        }

        log.info("foodie/write Get - ! {} ", businessNo);
        model.addAttribute("master", proBoardService.selectMaster(businessNo));
        return "promotion/pro-write";
    }

    @PostMapping("/write")
    public String write(HttpServletRequest request, ProBoard proBoard,
                        List<MultipartFile> titleImgFile,
                        List<MultipartFile> detailImgFiles,
                        List<MultipartFile> menuImgFiles) {

        log.info("foodie/write POST - ! {}", proBoard);
        log.info("foodie/write POST!! - titleImgFile : {}", titleImgFile.get(0).getOriginalFilename());
        log.info("foodie/write POST!! - detailImgFiles : {}", detailImgFiles.get(0).getOriginalFilename());
        log.info("foodie/write POST!! - menuImgFiles : {}", menuImgFiles.get(0).getOriginalFilename());

        List<String[]> menuList = new ArrayList<>(Arrays.asList(
                request.getParameterValues("menuName"),
                request.getParameterValues("menuPrice")
        ));

        Map<String, List<MultipartFile>> fileMap = new HashMap<>() {{
            put("title", titleImgFile);
            put("detail", detailImgFiles);
            put("menu", menuImgFiles);
        }};

        int promotionBno = proBoardService.saveProBoard(proBoard, menuList, fileMap);
        return "redirect:/proBoard/detail/" + promotionBno;
    }


    //    ---------------------------------------- modify ----------------------------------------

    @GetMapping("/modify/{promotionBno}")
    public String modify(HttpSession session, Model model, @PathVariable int promotionBno) {

        //        로그인 X , 관리자 X 일 경우 접근 불가.
//        if(!(LoginUtils.isLogin(session) && LoginUtils.getCurrentMemberAuth(session) == "MASTER"))
//        {
//            return "redirect:/login";
//        }
        ProBoard proBoard = proBoardService.selectProBoard(promotionBno);
        Master master = masterService.findOneForBusinessNoService(proBoard.getBusinessNo());

        model.addAttribute("master", master);
        // proBoard - ProBoard + Master + StoreTimeDTO 상속
        model.addAttribute("proBoard", proBoardService.selectProBoard(promotionBno));


        return "promotion/pro-modify";
    }

    @GetMapping("/modify/files/{promotionBno}") // 수정 (비동기) - 파일 + 메뉴 보여주기
    @ResponseBody
    public Map<String, Object> modifyFiles(@PathVariable int promotionBno) {
        String[] fileType = {"title", "detail"};
        Map<String, Object> infoMap = new HashMap<>();
        for (String type : fileType) {
            infoMap.put(type, proBoardService.selectFiles(promotionBno, type));
        }

        infoMap.put("menuList", proBoardService.selectMenuInfo(promotionBno));

        return infoMap;
    }

    @PostMapping("/modify") // 수정 - 저장 데이터 보내기
    public String modify(HttpServletRequest request, ProBoard proBoard,
                         List<MultipartFile> titleImgFile,
                         List<MultipartFile> detailImgFiles,
                         List<MultipartFile> menuImgFiles) {

        log.info("proBoard/modify POST - init ! {}", proBoard);
        log.info("proBoard/modify POST!! - titleImgFile : {}", titleImgFile.get(0).getOriginalFilename());
        log.info("proBoard/modify POST!! - detailImgFiles : {}", detailImgFiles.get(0).getOriginalFilename());
        log.info("proBoard/modify POST!! - menuImgFiles : {}", menuImgFiles.get(0).getOriginalFilename());

        List<String[]> menuList = new ArrayList<>(Arrays.asList(
                request.getParameterValues("menuName"),
                request.getParameterValues("menuPrice")
        ));

        Map<String, List<MultipartFile>> fileMap = new HashMap<>() {{
            put("title", titleImgFile);
            put("detail", detailImgFiles);
            put("menu", menuImgFiles);
        }};

        boolean proBoardModifyResult = proBoardService.modifyProBoard(proBoard, menuList, fileMap);
        return "redirect:/proBoard/detail/" + proBoard.getPromotionBno();
    }

    @DeleteMapping("/delete/{promotionBno}")
    public ResponseEntity deleteProBoard(@PathVariable int promotionBno)
    {
        log.info(" controller deleteProBoard init - {}",promotionBno);
        return proBoardService.deleteProBoard(promotionBno) ?
                new ResponseEntity(HttpStatus.OK) : new ResponseEntity(HttpStatus.EXPECTATION_FAILED);
    }


    @PostMapping("/promotion-faq")
    public String promotionFaq(PromotionFaq promotionFaq) {

//        ORA-00984: column not allowed here 오류 발생 -> 성렬씨께 문의 
        log.info("/promotion-faq POST! - {}", promotionFaq);

        promotionFaqService.saveService(promotionFaq);

        return "redirect:/proBoard/detail/" + promotionFaq.getPromotionBno();
    }
}
