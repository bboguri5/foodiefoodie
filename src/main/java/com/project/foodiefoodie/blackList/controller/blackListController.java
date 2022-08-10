package com.project.foodiefoodie.blackList.controller;

import com.project.foodiefoodie.blackList.domain.BlackList;
import com.project.foodiefoodie.blackList.service.BlackListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class blackListController {

    private final BlackListService bls;

    @GetMapping("/admin/member-blacklist")
    public String blackList(Model model) {

        log.info("/admin/member-blacklist GET! - ");

        List<BlackList> blackList = bls.findAllService();
        model.addAttribute("blackList", blackList);
        log.info("blackList - {}" , blackList);
        return "admin/member-blackList";
    }

}
