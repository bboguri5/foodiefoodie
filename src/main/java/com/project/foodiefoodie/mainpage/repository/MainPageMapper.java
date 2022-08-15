package com.project.foodiefoodie.mainpage.repository;

import com.project.foodiefoodie.mainpage.domain.MainPage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainPageMapper {

    // 메인 페이지에 평점 높은 7개 가게 불러오기
    List<MainPage> findTopToday();
}
