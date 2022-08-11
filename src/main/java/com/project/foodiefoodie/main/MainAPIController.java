package com.project.foodiefoodie.main;

import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.promotion.dto.PromotionReviewDTO;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@Log4j2
@CrossOrigin
public class MainAPIController {
    private final MasterService masterService;
    private final PromotionBoardService promotionBoardService;

    @GetMapping("/mylocation")
    public Map<String, Object> myLocation(String storeAddress) {
        log.info("mylocation GET - address : {}", storeAddress);

        Map<String, Object> replyMap = new HashMap<>();

        // master, promotion board -> map
        List<MasterDTO> masterList = masterService.findLocationRandService(storeAddress);
        log.info("masterList : - {}", masterList);
        List<PromotionReviewDTO> prdList = new ArrayList<>();
        getLocationMasters(masterList, prdList);

        replyMap.put("masterList", masterList);
        replyMap.put("prdList", prdList);

        return replyMap;
    }

    private void getLocationMasters(List<MasterDTO> masterList, List<PromotionReviewDTO> pmdList) {
        for (int i = 0; i < masterList.size(); i++) {
            pmdList.add(promotionBoardService.findOneService(masterList.get(i).getBusinessNo()));
        }
    }
}
