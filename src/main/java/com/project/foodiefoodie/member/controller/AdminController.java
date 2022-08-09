package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
public class AdminController {

    private final MemberService ms;

    @GetMapping("/admin/member-management")
    public String memberManagement() {



        return "admin/member-management";
    }


}
