package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Auth;
import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.service.AdminService;
import com.project.foodiefoodie.member.service.MasterAndMemberService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
    private final AdminService ads;
    private final MasterService ms;

    // 관리자 첫화면, 일반회원 목록
    @GetMapping("/admin/member")
    public String memberManagement(Model model) {

        log.info("/admin/member-management GET!! - ");

        List<Member> memberList = mbs.findCommonService();
        log.info("memberList - {}", memberList);

        model.addAttribute("comList", memberList);


        return "admin/member-common";
    }

    // 회원 탈퇴 처리
    @PostMapping("/admin/remove-member")
    public String removeMember(String email) {

        log.info("/admin/remove-member POST! - {}", email);

        mbs.removeService(email);

        return "redirect:/admin/member";
    }

    // 사업자 탈퇴 처리
    @PostMapping("/admin/remove-master")
    public String removeMaster(String businessNo) {

        log.info("/admin/remove-member POST! - {}", businessNo);

        ms.removeMasterService(businessNo);

        return "redirect:/admin/member";
    }


    // 사업자 관리 페이지
    @GetMapping("/admin/member-master")
    public String masterList(Model model) {

        log.info("/admin/member-master GET! - ");

        List<MasterAndMember> masterList = mms.findMasterService();

        model.addAttribute("masterList", masterList);
        log.info("masterList - {}", masterList);

        return "admin/member-master";
    }

    @GetMapping("/admin/approve-master")
    public String approveMaster(Model model) {

//        log.info("/admin/approveMaster GET! - ");

        List<MasterAndMember> approveList = mms.approveMasterService();
//        log.info("approveList - {}", approveList);

        model.addAttribute("approveList", approveList);

        return "admin/approve-master";
    }

    @PostMapping("/admin/approve")
    @Transactional
    public String approve(MasterAndMember masterAndMember, String approveType) {

        log.info("/admin/approve POST! - {}, {}", masterAndMember, approveType);

        if (approveType.equals("approve")) {
            AuthDTO authDTO = new AuthDTO();
            authDTO.setEmail(masterAndMember.getEmail());
            authDTO.setAuth("MASTER");
            ads.authChangeService(authDTO);
        } else if (approveType.equals("disapprove")) {
            ms.removeMasterService(masterAndMember.getBusinessNo());
        }

        return "redirect:/admin/approve-master";
    }


}
