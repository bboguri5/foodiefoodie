package com.project.foodiefoodie.blackList.service;

import com.project.foodiefoodie.blackList.domain.BlackListMaster;
import com.project.foodiefoodie.blackList.repository.BlackListMasterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BlackListMasterService {

    private final BlackListMasterMapper mapper;

    // 사업자 블랙리스트
    public List<BlackListMaster> findAllService() {
        return mapper.findAll();
    }

    // 사업자 번호로 단일 객체 조회 중간처리
    public BlackListMaster findOneService(String businessNo) {
        return mapper.findOne(businessNo);
    }

    // 사업자 블랙리스트 등록
    public boolean saveService(String businessNo) {
        return mapper.save(businessNo);
    }

    // 사업자 블랙리스트 삭제
    public boolean removeService(String businessNo) {
        return mapper.remove(businessNo);
    }
}
