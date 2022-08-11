package com.project.foodiefoodie.main.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.promotion.domain.PromotionBoard;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainController {

    private final HotDealService hotDealService;
    private final PromotionBoardService promotionBoardService;
    private final MasterService masterService;


    // 메인페이지 요청
    @GetMapping("/")
    public String mainPage(Model model) {

        // 카테고리 N개


        // 오늘의 맛집 TOP 7 --> 리뷰 많은 / 평점 좋은
        // 평점 & 리뷰 갯수 총합 탑 랜덤 겟
        List<PromotionReviewDTO> prd = promotionBoardService.topAvgRateCountService();
        List<MasterDTO> masterList = new ArrayList<>();
        getTopMasters(prd, masterList);
        
        model.addAttribute("prd", prd);
        model.addAttribute("masterList", masterList);

        // 푸디푸디 추천 맛집 --> 돈 받은 가게
        // 프리미엄 프로모션 보드에서 랜덤 겟?

        // 현재 위치 맛집 TOP 7 --> 내 위치
        // location 이름과 매칭되는 ADDRESS 불러와서 겟
//        List<MasterDTO> locationMasters =

        // 핫딜 리스트 TOP 6 --> 아무거나 TOP 6
        List<HotDeal> hotDeals = hotDealService.findRandHotService();
        List<MasterDTO> hotDealMasters = new ArrayList<>();
        List<PromotionReviewDTO> pmdList = new ArrayList<>();
        getHotDealMasters(hotDeals, hotDealMasters, pmdList);

        model.addAttribute("hotDeals", hotDeals);
        model.addAttribute("hotDealMasters", hotDealMasters);
        model.addAttribute("pmdList", pmdList);

        return "html/index";
    }

    // 핫딜 리스트의 마스터 정보 추출
    private void getHotDealMasters(List<HotDeal> hotDeals, List<MasterDTO> hotDealMasters, List<PromotionReviewDTO> pmdList) {
        for (int i = 0; i < hotDeals.size(); i++) {
            hotDealMasters.add(masterService.getMasterInfo(hotDeals.get(i).getBusinessNo()));
            pmdList.add(promotionBoardService.findOneService(hotDeals.get(i).getBusinessNo()));
        }
    }

    // 탑 리스트의 마스터 정보 추출
    private void getTopMasters(List<PromotionReviewDTO> prd, List<MasterDTO> masterList) {
        for (int i = 0; i < prd.size(); i++) {
            masterList.add(masterService.getMasterInfo(prd.get(i).getBusinessNo()));
        }
    }

    @GetMapping("/foodlist")
    public String foodList(Model model, Page page) {

        Map<String, Object> findAllMap = promotionBoardService.findAllService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Long) findAllMap.get("tc"));
        List<MasterDTO> masterList = new ArrayList<>();
        getAllMasters((List<PromotionBoard>) findAllMap.get("dbList"), masterList);

//        log.info("masterList findAll - {}", masterList);

        model.addAttribute("pm", pm);
        model.addAttribute("pb", findAllMap.get("dbList"));
        model.addAttribute("masterList", masterList);
        return "html/top-lists";
    }



    private void getAllMasters(List<PromotionBoard> prd, List<MasterDTO> masterList) {
        for (int i = 0; i < prd.size(); i++) {
            masterList.add(masterService.getMasterInfo(prd.get(i).getBusinessNo()));
        }
    }

    @GetMapping("/locationlist")
    public String locationList(Model model, String storeAddress, Page page) {

        Map<String, Object> findAllMap = masterService.findAllInLocationService(storeAddress, page);

        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Long) findAllMap.get("tc"));

        List<PromotionReviewDTO> prdList = new ArrayList<>();
        getAllPromotions(prdList, (List<MasterDTO>) findAllMap.get("dbList"));

        model.addAttribute("pm", pm);
        model.addAttribute("prdList", prdList);
        model.addAttribute("masterList", findAllMap.get("dbList"));
        model.addAttribute("address", storeAddress);
        return "html/location-list";
    }

    private void getAllPromotions(List<PromotionReviewDTO> prdList, List<MasterDTO> masterList) {
        for (int i = 0; i < masterList.size(); i++) {
            prdList.add(promotionBoardService.findOneService(masterList.get(i).getBusinessNo()));
        }
    }

    @GetMapping("/test")
    public String test() {
        return "html/test";
    }

}
