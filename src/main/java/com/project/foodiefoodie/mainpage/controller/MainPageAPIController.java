package com.project.foodiefoodie.mainpage.controller;

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
    private final MasterService masterService;

    @GetMapping("/mylocation")
    public Map<String, Object> myLocation(String storeAddress) {
        log.info("mylocation GET - address : {}", storeAddress);

        Map<String, Object> replyMap = new HashMap<>();
        List<PromotionMasterDTO> masterList = masterService.findLocationRandService(storeAddress);

        replyMap.put("masterList", masterList);

        return replyMap;
    }
}
