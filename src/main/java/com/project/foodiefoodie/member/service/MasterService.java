package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.member.repository.MasterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Log4j2
public class MasterService {

    private final MasterMapper mapper;

    public MasterDTO getMasterInfo(String businessNo) {
        return mapper.getMasterInfo(businessNo);
    }


    // 사업자 권한 요청시 DB 반영 전 중간처리 메서드
    public boolean requestAuthMaster(Master master) {

        // 중복된 사업자 번호인지 확인
        boolean flag = duplicateBusinessNo(master.getBusinessNo());

        // 중복된 사업자 번호가 아니라면,,
        if (!flag) {
            return mapper.requestAuthMaster(master);
        }

        // 중복된 사업자 번호라면,,
        return false;
    }


    // 중복된 사업자 번호인지 확인해주는 메서드
    private boolean duplicateBusinessNo(String businessNo) {
        return mapper.findBusinessNo(businessNo) == 1;
    }


    // 현재 위치 주소 비교하여 일치하는 TOP 7 식당 가져오는 중간 처리
    public List<MasterDTO> findLocationRandService(String storeAddress) {
        return mapper.findLocationRand(storeAddress);
    }

    public Map<String, Object> findAllInLocationService(String storeAddress, Page page) {
        List<MasterDTO> DBList = mapper.findAllInLocation(storeAddress, page);
        Long totalCnt = mapper.getMyTotalCnt(storeAddress);
        Map<String, Object> map = new HashMap<>();
        map.put("dbList", DBList);
        map.put("tc", totalCnt);
        return map;
    }
}
