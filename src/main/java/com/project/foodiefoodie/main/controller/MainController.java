package com.project.foodiefoodie.main.controller;

import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.service.HotDealService;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.review.dto.AvgStarDTO;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainController {

    private final HotDealService hotDealService;
    private final ReviewBoardService reviewBoardService;
    private final MasterService masterService;


    // 메인페이지 요청
    @GetMapping("/")
    public String mainPage(Model model) {

        // 카테고리 N개

        // 오늘의 맛집 TOP 7 --> 리뷰 많은 / 평점 좋은
        // 평점 & 리뷰 갯수 총합 탑 랜덤 겟
        List<AvgStarDTO> avgStars = reviewBoardService.avgStarRateService();
        List<AvgStarDTO> sevenList = new ArrayList<>();
        List<MasterDTO> masterList = new ArrayList<>();
        topSeven(avgStars, sevenList, masterList);
        log.info("avgStars - {}", sevenList);
        model.addAttribute("avgStars", sevenList);
        model.addAttribute("masterList", masterList);


        // 푸디푸디 추천 맛집 --> 돈 받은 가게
        // 프리미엄 프로모션 보드에서 랜덤 겟?

        // 현재 위치 맛집 TOP 7 --> 내 위치
        // location 이름과 매칭되는 ADDRESS 불러와서 겟

        // 핫딜 리스트 TOP 6 --> 아무거나 TOP 6
        List<HotDeal> hotDeals = hotDealService.findAllService();
        List<HotDeal> sixList = new ArrayList<>();

        // 핫딜 6개 랜덤 GET
        getRandomDeals(hotDeals, sixList);

        model.addAttribute("sixList", sixList);
        return "html/index";
    }

    @GetMapping("/test")
    public String test() {
        return "html/test";
    }

    // 메인페이지에 디스플레이 할 핫딜 6개 랜덤 SELECT
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

    // 메인 페이지에 넣을 오늘의 맛집 상위 7개 리스트 추출
    // 상위 7개 리스트에 해당하는 마스터 인포 DTO 추출
    private void topSeven(List<AvgStarDTO> avgStars, List<AvgStarDTO> sevenList, List<MasterDTO> masterList) {
        for (int i = 0; i < 7; i++) {
            sevenList.add(avgStars.get(i));
            masterList.add(masterService.getMasterInfo(avgStars.get(i).getBusinessNo()));
        }
    }
}
