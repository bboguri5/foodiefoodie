package com.project.foodiefoodie.hotdeal.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class HotDealController {

    private final HotDealService hotDealService;

    // Hot Deal 랜덤 6개 목록 요청
    @GetMapping("/hotdeals")
    public String hotDeals(Model model, Page page) {
        Map<String, Object> findAllMap = hotDealService.findAllService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("hotDeals", findAllMap.get("dbList"));
        return "html/hot-deals";
    }

}
