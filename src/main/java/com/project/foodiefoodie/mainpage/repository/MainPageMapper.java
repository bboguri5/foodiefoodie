package com.project.foodiefoodie.mainpage.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.mainpage.domain.MainPage;
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

}
