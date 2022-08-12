package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterAndMemberService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.member.service.MemberService;
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
    private final MasterAndMemberService mms;

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

        List<MasterAndMember> masterList = mms.findMasterService();

        model.addAttribute("masterList", masterList);
        log.info("masterList - {}", masterList);

        return "admin/member-master";
    }

}
