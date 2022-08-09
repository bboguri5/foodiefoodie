package com.project.foodiefoodie.main.controller;

import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainController {

    private final HotDealService hotDealService;

    // 메인페이지 요청
    @GetMapping("/")
    public String mainPage(Model model) {

        // 카테고리 N개

        // 오늘의 맛집 TOP 7 --> 리뷰 많은 / 평점 좋은

        // 푸디푸디 추천 맛집 --> 돈 받은 가게

        // 현재 위치 맛집 TOP 7 --> 내 위치

        // 핫딜 리스트 TOP 6 --> 아무거나 TOP 6

        List<HotDeal> hotDeals = hotDealService.findAllService();
        List<HotDeal> sixList = new ArrayList<>();
        getRandomDeals(hotDeals, sixList);

        model.addAttribute("sixList", sixList);
        return "html/index";
    }

    private void getRandomDeals(List<HotDeal> hotDeals, List<HotDeal> sixList) {
        List<Integer> randShuffle = new ArrayList<>();
        for (int i = 0; i < hotDeals.size(); i++) {
            randShuffle.add(i);
        }
        Collections.shuffle(randShuffle);
        log.info("shuffled list - {}", randShuffle);

        for (int i = 0; i < 6; i++) {
            sixList.add(hotDeals.get(randShuffle.get(i)));
        }
    }

}
