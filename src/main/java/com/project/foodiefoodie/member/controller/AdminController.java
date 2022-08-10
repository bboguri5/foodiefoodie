package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.blackList.domain.BlackList;
import com.project.foodiefoodie.blackList.service.BlackListService;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.reportMember.domain.ReportMember;
import com.project.foodiefoodie.reportMember.service.ReportMemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class AdminController {

    private final MemberService mbs;
    private final MasterService mms;

    @GetMapping("/admin/member-management")
    public String memberManagement(Model model) {

        log.info("/admin/member-management GET!! - ");

        List<Member> memberList = mbs.findCommonService();
        log.info("memberList - {}", memberList);

        model.addAttribute("comList", memberList);


        return "admin/member-common";
    }

    @PostMapping("/admin/remove-member")
    public String removeMember(String email) {

        log.info("/admin/remove-member POST! - {}", email);

        mbs.removeService(email);

        return "redirect:/admin/member-management";
    }
    @GetMapping("/admin/member-master")
    public String masterList(Model model) {

        log.info("/admin/member-master GET! - ");

        List<Master> masterList = mms.findMasterService();

        model.addAttribute("masterList", masterList);
        log.info("masterList - {}", masterList);

        return "admin/member-master";
    }

}
