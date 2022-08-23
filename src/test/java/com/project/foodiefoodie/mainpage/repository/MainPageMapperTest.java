package com.project.foodiefoodie.mainpage.repository;

import com.project.foodiefoodie.mainpage.domain.MainPage;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MainPageMapperTest {

    @Autowired MainPageMapper mapper;

    @Test
    @DisplayName("오늘의 맛집 TOP 7개의 정보를 출력해야 한다")
    void findTopTodayTest() {
        List<MainPage> topToday = mapper.findTopToday();
        System.out.println(topToday);
    }
}