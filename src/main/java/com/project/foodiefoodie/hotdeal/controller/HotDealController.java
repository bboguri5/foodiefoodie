package com.project.foodiefoodie.hotdeal.controller;

import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class HotDealController {

    private final HotDealService hotDealService;

    // Hot Deal 목록 요청
    @GetMapping("/hotdeals")
    public String hotDeals(Model model) {
        log.info("Hot Deals Get ! - {}");
        List<HotDeal> hotDeals = hotDealService.findAllService();
        log.info("hotDeals - {}", hotDeals);
        model.addAttribute("hotDeals", hotDeals);
        return "html/hot-deals";
    }

}
