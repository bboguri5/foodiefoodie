package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.service.MasterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MasterController {

    private final MasterService masterService;


    // 사업자 등록 화면 요청 처리
    @GetMapping("/master/register")
    public String requestAuthMaster() {
        return "/member/master/request-auth";
    }


    // 사업자 번호 중복 비동기 처리
    @GetMapping("/master/check")
    @ResponseBody
    public ResponseEntity<Boolean> duplicateBusinessNo(String businessNo) {

        boolean flag = masterService.duplicateBusinessNo(businessNo);

        return new ResponseEntity<>(flag, HttpStatus.OK);
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
