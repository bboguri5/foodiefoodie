package com.project.foodiefoodie.hotdeal.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.hotdeal.domain.HotDeal;
import com.project.foodiefoodie.hotdeal.repository.HotDealMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class HotDealService {

    private final HotDealMapper hotDealMapper;

    // Hot Deal 목록 요청 중간 처리
    public boolean saveService(HotDeal deal) {
        return hotDealMapper.save(deal);
    }

    // hot deal 랜덤 6개 목록 요청 중간 처리
    public List<HotDeal> findRandHotService() {
        return hotDealMapper.findRandHot();
    }

    public HotDeal findOneService(String businessNo) {
        return hotDealMapper.findOne(businessNo);
    }

    public boolean removeService(String businessNo) {
        return hotDealMapper.remove(businessNo);
    }

    public boolean modifyService(HotDeal deal) {
        return hotDealMapper.modify(deal);
    }

    public Map<String, Object> findAllService(Page page) {
        List<HotDeal> DBList = hotDealMapper.findAll(page);
        Long totalCnt = hotDealMapper.getMyTotalCnt();
        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
    }
}
