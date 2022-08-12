package com.project.foodiefoodie.main.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.hotdeal.dto.DealPromotionMasterDTO;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.premium.dto.PremiumPromotionBoardDTO;
import com.project.foodiefoodie.premium.service.PremiumPromotionBoardService;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
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
public class MainController {

    private final HotDealService hotDealService;
    private final PromotionBoardService promotionBoardService;
    private final MasterService masterService;
    private final PremiumPromotionBoardService premiumPromotionBoardService;


    // 메인페이지 요청
    @GetMapping("/")
    public String mainPage(Model model) {

        // 카테고리 N개
        // 오늘의 맛집 TOP 7 --> 리뷰 많은 / 평점 좋은
        // 평점 & 리뷰 갯수 총합 탑 랜덤 겟
        List<PromotionMasterDTO> pmd = promotionBoardService.topAvgRateCountService();
        model.addAttribute("pmd", pmd);

        // 푸디푸디 추천 맛집 --> 돈 받은 가게
        // 프리미엄 프로모션 보드에서 랜덤 겟?
        List<PremiumPromotionBoardDTO> premiumList = premiumPromotionBoardService.findSevenRand();
        model.addAttribute("premiumList", premiumList);

        // 현재 위치 맛집 TOP 7 --> 내 위치
        // location 이름과 매칭되는 ADDRESS 불러와서 겟
        // index 내에서 비동기 처리됨

        // 핫딜 리스트 TOP 6 --> 아무거나 TOP 6
        List<DealPromotionMasterDTO> hotDeals = hotDealService.findRandHotService();
        model.addAttribute("hotDeals", hotDeals);

        return "html/index";
    }


    @GetMapping("/foodlist")
    public String foodList(Model model, Page page) {

        Map<String, Object> findAllMap = promotionBoardService.findAllService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("dbList", findAllMap.get("dbList"));
        return "html/top-lists";
    }

    @GetMapping("/locationlist")
    public String locationList(Model model, String storeAddress, Page page) {

        Map<String, Object> findAllMap = masterService.findAllInLocationService(storeAddress, page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("masterList", findAllMap.get("dbList"));
        model.addAttribute("address", storeAddress);
        return "html/location-list";
    }

    @GetMapping("/test")
    public String test() {
        return "html/test";
    }

}
