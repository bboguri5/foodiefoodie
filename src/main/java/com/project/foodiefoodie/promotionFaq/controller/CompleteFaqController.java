package com.project.foodiefoodie.promotionFaq.controller;

import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.service.ReplyFaqService;
import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import com.project.foodiefoodie.reviewFaq.service.ReviewFaqService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class CompleteFaqController {

    private final PromotionFaqService profs;
    private final ReviewFaqService reviewfs;
    private final ReplyFaqService replyfs;

    @GetMapping("/admin/completeFaq")
    public String completeFaqList(Model model) {

        log.info("/admin/completeFaq GET! - ");
        String T = "T";
        List<PromotionFaq> promotionFaqList = profs.findAllService(T);
        List<ReviewFaq> reviewFaqList = reviewfs.findAllService(T);
        List<ReplyFaq> replyFaqList = replyfs.findAllService(T);

        model.addAttribute("promotionFaqList", promotionFaqList);
        model.addAttribute("reviewFaqList", reviewFaqList);
        model.addAttribute("replyFaqList", replyFaqList);

        log.info("promotionFaqList - {}", promotionFaqList);
        log.info("reviewFaqList - {}", reviewFaqList);
        log.info("replyFaqList - {}", replyFaqList);


        return "admin/complete-faq";
    }

}
