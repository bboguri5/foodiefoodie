package com.project.foodiefoodie.myPage.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.myPage.dto.*;
import com.project.foodiefoodie.myPage.service.MyReportService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
public class MyReportController {

    private final MyReportService reportService;

    @GetMapping("/myPage/reviewReport")
    public String reviewReportController(HttpSession session, Model model){
        Member member = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = member.getEmail();
//        List<ReviewReportDTO> reviewReportDTOS = reportService.reviewReportDTOListService(email);
        List<ReviewReportDTO2> reviewReportDTO2s = reportService.reviewReportDTOListService2(email);

        model.addAttribute("reviewReports", reviewReportDTO2s );
        return "/myPage/reviewReport";

    }
    @GetMapping("/myPage/replyReport")
    public String replyReportController(HttpSession session, Model model){
        Member member = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = member.getEmail();
//        List<ReplyReportDTO> replyReportDTOS = reportService.replyReportDTOListService(email);
        List<ReplyReportDTO2> replyReportDTO2s = reportService.replyReportDTOListService2(email);
        model.addAttribute("replyReports",replyReportDTO2s);
        return "/myPage/replyReport";
    }

    @GetMapping("/master/promotionReport/{masterNum}&{businessNo}")
    public String PromotionReportList(@PathVariable int masterNum, @PathVariable String businessNo, HttpSession session, Model model){
        Member member = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = member.getEmail();
        PromotionInputDTO promotionInputDTO = new PromotionInputDTO();
        promotionInputDTO.setBusinessNo(businessNo);
        promotionInputDTO.setEmail(email);
        List<PromotionReportDTO> promotionReportDTOS = reportService.promotionReportDTOListService(promotionInputDTO);
        model.addAttribute("proReportList",promotionReportDTOS);
        return "/myPage/promotionReport";
    }




}
