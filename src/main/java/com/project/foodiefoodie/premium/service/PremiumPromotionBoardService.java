package com.project.foodiefoodie.premium.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.hotdeal.dto.DealPromotionMasterDTO;
import com.project.foodiefoodie.premium.dto.PremiumPromotionBoardDTO;
import com.project.foodiefoodie.premium.repository.PremiumPromotionBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class PremiumPromotionBoardService {

    private final PremiumPromotionBoardMapper mapper;

    public Map<String, Object> findAllService(Page page) {
        List<PremiumPromotionBoardDTO> DBList = mapper.findAll(page);
        int totalCnt = mapper.getMyTotalCnt();
        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
    }

    public List<PremiumPromotionBoardDTO> findSevenRand() {
        return mapper.findSevenRand();
    }


}
