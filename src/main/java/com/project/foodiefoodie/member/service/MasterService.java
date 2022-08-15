package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.member.repository.MasterMapper;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
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

    // 사업자 권한 요청시 DB 반영 전 중간처리 메서드
    public boolean requestAuthMaster(Master master) {

        return mapper.requestAuthMaster(master);
    }


    // 중복된 사업자 번호인지 확인해주는 메서드
    public boolean duplicateBusinessNo(String businessNo) {
        return mapper.findBusinessNo(businessNo) == 1;
    }

}
