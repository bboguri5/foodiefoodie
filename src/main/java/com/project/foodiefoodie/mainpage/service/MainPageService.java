package com.project.foodiefoodie.mainpage.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.mainpage.domain.MainPage;
import com.project.foodiefoodie.mainpage.repository.MainPageMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class MainPageService {

    private final MainPageMapper mapper;

    // 메인 페이지에 평점 높은 7개 가게 정보 요청 중간 처리
    public List<MainPage> findTopTodayService() {
        return mapper.findTopToday();
    }

    // 평점순 정렬된 오늘의 맛집 정보 요청 중간 처리
    public Map<String, Object> findTopTodayAllService(Page page) {
        List<MainPage> topTodayAll = mapper.findTopTodayAll(page);
        int totalCnt = mapper.getTotalCnt();
        Map<String, Object> map = new HashMap<>();
        map.put("topTodayAll", topTodayAll);
        map.put("tc", totalCnt);
        return map;
    }

    // 월정액 가게 랜덤으로 메인 페이지에 7개 요청 중간 처리
    public List<MainPage> findRandPremiumService() {
        return mapper.findRandPremium();
    }

    // 월정액 가게 전체 불러오기 중간 처리
    public Map<String, Object> findAllPremiumService(Page page) {
        List<MainPage> premiumList = mapper.findAllPremium(page);
        int totalCnt = mapper.getPremiumCnt();
        Map<String, Object> map = new HashMap<>();
        map.put("premiumList", premiumList);
        map.put("tc", totalCnt);
        return map;
    }

    // 현재 위치에 있는 랜덤 6개 가게 불러오기 중간 처리
    public List<MainPage> findLocationRandService(String storeAddress) {
        return mapper.findLocationRand(storeAddress);
    }

    // 현재 위치에 있는 가게 전체 불러오기 중간 처리
    public Map<String, Object> findAllInLocationService(String storeAddress, Page page) {
        List<MainPage> locationList = mapper.findAllInLocation(storeAddress, page);
        int totalCnt = mapper.getLocationCnt(storeAddress);
        Map<String, Object> map = new HashMap<>();
        map.put("locationList", locationList);
        map.put("tc", totalCnt);
        return map;
    }

    // hot deal 랜덤 6개 목록 요청 중간 처리
    public List<MainPage> findRandHotDealService() {
        return mapper.findRandHotDeal();
    }

    // hot deal 목록 요청 중간 처리
    public Map<String, Object> findAllHotDealService(Page page) {
        List<MainPage> hotDeals = mapper.findAllHotDeal(page);
        int totalCnt = mapper.getHotDealCnt();
        Map<String, Object> map = new HashMap<>();
        map.put("hotDeals", hotDeals);
        map.put("tc", totalCnt);
        return map;
    }
}
