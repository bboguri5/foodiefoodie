package com.project.foodiefoodie.mainpage.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.search.Search;
import com.project.foodiefoodie.mainpage.domain.MainPage;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainPageMapper {

    // 메인 페이지에 평점 높은 7개 가게 불러오기
    List<MainPage> findTopToday();

    // 오늘의 맛집 평점 순으로 전체 불러오기
    List<MainPage> findTopTodayAll(Page page);

    // 오늘의 맛집 개수 불러오기
    int getTotalCnt();

    // 월정액 가게 랜덤으로 메인 페이지에 7개 불러오기
    List<MainPage> findRandPremium();

    // 월정액 가게 전체 불러오기
    List<MainPage> findAllPremium(Page page);

    // 프리미엄 가게 개수 계산
    int getPremiumCnt();

    // 현재 위치에 있는 랜덤 6개 가게 불러오기
    List<MainPage> findLocationRand(String storeAddress);

    // 현재 위치에 있는 가게 전체 불러오기
    List<MainPage> findAllInLocation(@Param("storeAddress") String storeAddress, @Param("page")Page page);

    // 현재 위치에 있는 가게 개수 계산
    int getLocationCnt(String storeAddress);


    // hot deal 랜덤 6개 목록 요청
    List<MainPage> findRandHotDeal();

    // hot deal 목록 요청 중간 처리
    List<MainPage> findAllHotDeal(Page page);

    // 기간 내 핫딜 개수
    int getHotDealCnt();


    // 해당 서치 리스트 가져오기
    List<MainPage> findAllSearch(@Param("s") Search search, @Param("sort") String sort);

    // 해당 서치 개수
    int getTotalCount(Search search);

    // 해당 해쉬태그 리스트 가져오기
    List<MainPage> findHashTag(@Param("hashTag") String hashTag, @Param("page") Page page);

    // 해당 해쉬태그 개수
    int findHashTagCount(String hashTag);

}
