package com.project.foodiefoodie.reportMember.controller;

import com.project.foodiefoodie.reportMember.domain.ReportMember;
import com.project.foodiefoodie.reportMember.service.ReportMemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class ReportMemberController {

    private final ReportMemberService rms;

    @GetMapping("/admin/member-reportmember")
    public String reportMember(Model model) {

        log.info("/admin/member-reportmember GET! - ");

        List<ReportMember> reportMemberList = rms.findAllService();
        model.addAttribute("reportMemberList", reportMemberList);
        log.info("reportMemberList - {}", reportMemberList);
        return "admin/member-reportmember";
    }
}
