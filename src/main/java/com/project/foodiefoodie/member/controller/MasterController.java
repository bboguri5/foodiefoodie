package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.service.MasterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MasterController {

    private final MasterService masterService;


    // 사업자 등록 화면 요청 처리
    @GetMapping("/request-auth")
    public String requestAuthMaster() {
        return "/member/master/request-auth";
    }



    // 실질적 사업자 등록 요청 처리
    @PostMapping("/request-auth")
    public String requestAuthMaster(Master master, RedirectAttributes ra) {

        log.info("/request-auth POST!! -{}", master);


        boolean flag = masterService.requestAuthMaster(master);

        if (flag) {
            return "/member/master/request-success";
        }

        ra.addFlashAttribute("resultMsg", "fail");

        return "redirect:/request-auth";
    }
}
