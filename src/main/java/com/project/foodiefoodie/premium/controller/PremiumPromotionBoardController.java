package com.project.foodiefoodie.premium.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.premium.dto.PremiumPromotionBoardDTO;
import com.project.foodiefoodie.premium.service.PremiumPromotionBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class PremiumPromotionBoardController {

    private final PremiumPromotionBoardService service;

    @GetMapping("/premiumlist")
    public String premiumList(Page page, Model model) {
        Map<String, Object> findAllMap = service.findAllService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("premiumList", findAllMap.get("dbList"));

        return "html/premium-list";
    }
}
