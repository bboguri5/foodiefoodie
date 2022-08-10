package com.project.foodiefoodie.proBoard.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/foodie")
public class PromotionBoardController {

    @GetMapping("/detail")
    public String detail() {
        log.info(" foodie/detail Get - ! ");
        return "promotion/pro-detail";
    }

    @GetMapping("/write")
    public String write(){
        log.info("foodie/write Get - !");
        return "promotion/pro-write";
    }


}
