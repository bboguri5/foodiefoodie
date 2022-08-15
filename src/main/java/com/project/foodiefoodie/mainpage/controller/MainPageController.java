package com.project.foodiefoodie.mainpage.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.common.search.Search;
import com.project.foodiefoodie.hotdeal.dto.DealPromotionMasterDTO;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import com.project.foodiefoodie.mainpage.domain.MainPage;
import com.project.foodiefoodie.mainpage.service.MainPageService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainPageController {

    private final HotDealService hotDealService;
    private final PromotionBoardService promotionBoardService;
    private final MainPageService mainPageService;

    // 메인페이지 요청
    @GetMapping("/")
    public String mainPage(Model model) {

        // 카테고리 N개
        Map<String, Integer> hashTags = new HashMap<>();
        getHashTagMap(hashTags);
        model.addAttribute("hashTags", hashTags);

        // 오늘의 맛집 TOP 7 --> 평균 평점 계산하여 상위 7개 가져오기
        List<MainPage> topToday = mainPageService.findTopTodayService();
        model.addAttribute("topToday", topToday);

        // 푸디푸디 추천 맛집 --> 월정액 가게들 랜덤으로 메인에 보여주기 (기한 체크)
        List<MainPage> premiumList = mainPageService.findRandPremiumService();
        model.addAttribute("premiumList", premiumList);

        // 현재 나의 위치 맛집 중 TOP 7 -->
        // location 이름과 매칭되는 ADDRESS 불러와서 겟
        // index.jsp 내에서 비동기 처리됨

        // 핫딜 리스트 TOP 6 --> 아무거나 TOP 6
        List<DealPromotionMasterDTO> hotDeals = hotDealService.findRandHotService();
        model.addAttribute("hotDeals", hotDeals);

        return "html/index";
    }

    // 평점순 정렬된 오늘의 맛집 정보 전체 불러오기
    @GetMapping("/foodlist")
    public String foodList(Model model, Page page) {

        Map<String, Object> findAllMap = mainPageService.findTopTodayAllService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("topTodayAll", findAllMap.get("topTodayAll"));
        return "html/top-lists";
    }

    @GetMapping("/premiumlist")
    public String premiumList(Page page, Model model) {
        Map<String, Object> findAllMap = mainPageService.findAllPremiumService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("premiumList", findAllMap.get("premiumList"));

        return "html/premium-list";
    }

    @GetMapping("/locationlist")
    public String locationList(Model model, String storeAddress, Page page) {

        Map<String, Object> findAllMap = mainPageService.findAllInLocationService(storeAddress, page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("locations", findAllMap.get("locationList"));
        model.addAttribute("address", storeAddress);
        return "html/location-list";
    }

    private Map<String, Integer> getHashTagMap(Map<String, Integer> hashTags) {
        hashTags.put("korean", promotionBoardService.findHashTagCountService("한식"));
        hashTags.put("chinese", promotionBoardService.findHashTagCountService("중식"));
        hashTags.put("japanese", promotionBoardService.findHashTagCountService("일식"));
        hashTags.put("western", promotionBoardService.findHashTagCountService("양식"));
        hashTags.put("bar", promotionBoardService.findHashTagCountService("술집"));
        hashTags.put("cafe", promotionBoardService.findHashTagCountService("카페"));
        return hashTags;
    }





    @GetMapping("/list")
    public String list(@ModelAttribute("s") Search search, Model model) {
        log.info("controller request /board/list GET! - search: {}", search);

        Map<String, Object> boardMap = promotionBoardService.findAllSearchService(search);
        log.info("return data - {}", boardMap.get("bList"));

        // 페이지 정보 생성
        PageMaker pm = new PageMaker(
                new Page(search.getPageNum(), search.getAmount())
                , (Integer) boardMap.get("tc"));

        model.addAttribute("bList", boardMap.get("bList"));
        model.addAttribute("pm", pm);

        return "html/search-list";
    }

    @GetMapping("/hashtag")
    public String hashTagList(Model model, String tag, Page page) {
        Map<String, Object> findAllMap = promotionBoardService.findHashTagService(tag, page);

        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));
        model.addAttribute("tag", tag);
        model.addAttribute("pm", pm);
        model.addAttribute("hashTagList", findAllMap.get("bList"));

        log.info("hashTagList pm.endPage - {}", pm.getEndPage());

        return "html/hash-search";
    }

    @GetMapping("/test")
    public String test() {
        return "html/test";
    }

}
