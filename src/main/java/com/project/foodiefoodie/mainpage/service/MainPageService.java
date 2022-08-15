package com.project.foodiefoodie.mainpage.service;

import com.project.foodiefoodie.mainpage.domain.MainPage;
import com.project.foodiefoodie.mainpage.repository.MainPageMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class MainPageService {

    private final MainPageMapper mapper;

    // 메인 페이지에 평점 높은 7개 가게 불러오기 중간 처리
    public List<MainPage> findTopTodayService() {
        return mapper.findTopToday();
    }
}
