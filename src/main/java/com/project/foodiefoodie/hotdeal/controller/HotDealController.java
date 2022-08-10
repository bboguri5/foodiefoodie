package com.project.foodiefoodie.hotdeal.controller;

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

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class HotDealController {

    private final HotDealService hotDealService;
    private final MasterService masterService;
    private final PromotionBoardService promotionBoardService;

    // Hot Deal 랜덤 6개 목록 요청
    @GetMapping("/hotdeals")
    public String hotDeals(Model model) {
        log.info("Hot Deals Get ! - {}");

        List<HotDeal> hotDeals = hotDealService.findAllService();
        log.info("hotDeals - {}", hotDeals);

        List<MasterDTO> hotDealMasters = new ArrayList<>();
        List<PromotionReviewDTO> pmdList = new ArrayList<>();
        getHotDealMasters(hotDeals, hotDealMasters, pmdList);

        model.addAttribute("hotDeals", hotDeals);
        model.addAttribute("hotDealMasters", hotDealMasters);
        model.addAttribute("pmdList", pmdList);
        return "html/hot-deals";
    }

    // 핫딜 리스트의 마스터 정보 추출
    private void getHotDealMasters(List<HotDeal> hotDeals, List<MasterDTO> hotDealMasters, List<PromotionReviewDTO> pmdList) {
        for (int i = 0; i < hotDeals.size(); i++) {
            hotDealMasters.add(masterService.getMasterInfo(hotDeals.get(i).getBusinessNo()));
            pmdList.add(promotionBoardService.findOneService(hotDeals.get(i).getBusinessNo()));
        }
    }

}
