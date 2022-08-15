package com.project.foodiefoodie.mainpage.controller;

import com.project.foodiefoodie.mainpage.domain.MainPage;
import com.project.foodiefoodie.mainpage.service.MainPageService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@Log4j2
@CrossOrigin
public class MainPageAPIController {
    private final MainPageService mainPageService;

    @GetMapping("/mylocation")
    public Map<String, Object> myLocation(String storeAddress) {
//        log.info("mylocation GET - address : {}", storeAddress);
        Map<String, Object> replyMap = new HashMap<>();
        List<MainPage> locationList =  mainPageService.findLocationRandService(storeAddress);

        replyMap.put("locationList", locationList);

        return replyMap;
    }
}
