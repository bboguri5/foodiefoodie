package com.project.foodiefoodie.promotionFaq.controller;

import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
public class PromotionFaqController {

    private final PromotionFaqService pros;


    @GetMapping("/admin/promotionFaq")
    public String promotionFaqList(Model model) {

        log.info("/admin/promotionFaq GET! - ");
        pros.findAllService();



        return "admin/promotionFaq";
    }
}
