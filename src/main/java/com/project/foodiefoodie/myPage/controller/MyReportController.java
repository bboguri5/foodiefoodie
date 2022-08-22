package com.project.foodiefoodie.myPage.controller;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.myPage.dto.ReplyReportDTO;
import com.project.foodiefoodie.myPage.dto.ReviewReportDTO;
import com.project.foodiefoodie.myPage.service.MyReportService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MyReportController {

    private final MyReportService reportService;

    @GetMapping("/reviewReport")
    public String reviewReportController(HttpSession session, Model model){
        Member member = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = member.getEmail();
        List<ReviewReportDTO> reviewReportDTOS = reportService.reviewReportDTOListService(email);
        model.addAttribute("reviewReports",reviewReportDTOS);
        return "/myPage/reviewReport";
    }
    @GetMapping("/replyReport")
    public String replyReportController(HttpSession session, Model model){
        Member member = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = member.getEmail();
        List<ReplyReportDTO> replyReportDTOS = reportService.replyReportDTOListService(email);
        model.addAttribute("replyReports",replyReportDTOS);
        return "/myPage/replyReport";
    }





}
