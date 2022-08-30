package com.project.foodiefoodie.mainpage.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.search.Search;
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
        List<MainPage> topToday = mapper.findTopToday();
        isOpenService(topToday);
        return topToday;
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

    public Map<String, Object> findAllSearchService(Search search, String sort) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<MainPage> searchList = mapper.findAllSearch(search, sort);

        findDataMap.put("searchList", searchList);
        findDataMap.put("tc", mapper.getTotalCount(search));

        return findDataMap;
    }

    // 해당 해쉬태그 리스트 가져오기 중간 처리
    public Map<String, Object> findHashTagService(String tag, Page page) {

        Map<String, Object> findDataMap = new HashMap<>();

        List<MainPage> hashTagList = mapper.findHashTag(tag, page);
        findDataMap.put("hashTagList", hashTagList);
        findDataMap.put("tc", mapper.findHashTagCount(tag));
        return findDataMap;
    }

    public Map<String, Integer> findHashTagCountService(Map<String, Integer> hashTags) {
        hashTags.put("korean", mapper.findHashTagCount("한식"));
        hashTags.put("chinese", mapper.findHashTagCount("중식"));
        hashTags.put("japanese", mapper.findHashTagCount("일식"));
        hashTags.put("western", mapper.findHashTagCount("양식"));
        hashTags.put("bar", mapper.findHashTagCount("술집"));
        hashTags.put("cafe", mapper.findHashTagCount("카페"));
        return hashTags;
    }

    private void isOpenService(List<MainPage> list) {
        for (MainPage o : list) {
            String isOpen = mapper.isOpen(o.getPromotionBno());
            log.info("isOpen - {}", isOpen);
            o.setIsOpen(isOpen);
        }
    }
}
