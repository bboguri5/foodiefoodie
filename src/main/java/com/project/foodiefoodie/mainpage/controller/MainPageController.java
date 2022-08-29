package com.project.foodiefoodie.mainpage.controller;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.common.search.Search;
import com.project.foodiefoodie.mainpage.domain.MainPage;
import com.project.foodiefoodie.mainpage.service.MainPageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainPageController {

    private final MainPageService mainPageService;

    // 메인페이지 요청
    @GetMapping("/")
    public String mainPage(Model model) {

        model.addAttribute("todayDate", getTodayDate());

        // 카테고리 N개
        Map<String, Integer> hashTags = new HashMap<>();
        mainPageService.findHashTagCountService(hashTags);
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
        List<MainPage> hotDeals = mainPageService.findRandHotDealService();
        model.addAttribute("hotDeals", hotDeals);

        return "main/index";
    }

    private String getTodayDate() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now);
    }

    // 해당 해쉬태그 리스트 전체 조회
    @GetMapping("/hashtag")
    public String hashTagList(Model model, String tag, Page page) {
        Map<String, Object> findAllMap = mainPageService.findHashTagService(tag, page);

        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));
        model.addAttribute("tag", tag);
        model.addAttribute("pm", pm);
        model.addAttribute("hashTagList", findAllMap.get("hashTagList"));
        model.addAttribute("todayDate", getTodayDate());

        log.info("hashTagList pm.endPage - {}", pm.getEndPage());

        return "main/hash-search";
    }

    // 평점순 정렬된 오늘의 맛집 정보 전체 불러오기
    @GetMapping("/foodlist")
    public String foodList(Model model, Page page) {

        Map<String, Object> findAllMap = mainPageService.findTopTodayAllService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("topTodayAll", findAllMap.get("topTodayAll"));
        model.addAttribute("todayDate", getTodayDate());
        return "main/top-lists";
    }

    @GetMapping("/premiumlist")
    public String premiumList(Page page, Model model) {
        Map<String, Object> findAllMap = mainPageService.findAllPremiumService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("premiumList", findAllMap.get("premiumList"));
        model.addAttribute("todayDate", getTodayDate());

        return "main/premium-list";
    }

    @GetMapping("/locationlist")
    public String locationList(Model model, String storeAddress, Page page) {

        Map<String, Object> findAllMap = mainPageService.findAllInLocationService(storeAddress, page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("locations", findAllMap.get("locationList"));
        model.addAttribute("address", storeAddress);
        model.addAttribute("todayDate", getTodayDate());
        return "main/location-list";
    }

    @GetMapping("/hotdeals")
    public String hotDeals(Model model, Page page) {
        Map<String, Object> findAllMap = mainPageService.findAllHotDealService(page);
        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()), (Integer) findAllMap.get("tc"));

        model.addAttribute("pm", pm);
        model.addAttribute("hotDeals", findAllMap.get("hotDeals"));
        model.addAttribute("todayDate", getTodayDate());

        return "main/hot-deals";
    }

    @GetMapping("/list")
    public String list(@ModelAttribute("s") Search search, Model model, String sort) {
        log.info("controller request /board/list GET! - search: {}", search);

        Map<String, Object> boardMap = mainPageService.findAllSearchService(search, sort);
//        log.info("return data - {}", boardMap.get("searchList"));

        // 페이지 정보 생성
        PageMaker pm = new PageMaker(
                new Page(search.getPageNum(), search.getAmount())
                , (Integer) boardMap.get("tc"));

        model.addAttribute("searchList", boardMap.get("searchList"));
        model.addAttribute("pm", pm);
        model.addAttribute("todayDate", getTodayDate());
        model.addAttribute("search", search);

        return "main/search-list";
    }
}
