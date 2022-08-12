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

    public List<BlackListMaster> findAllService() {
        return mapper.findAll();
    }

    public BlackListMaster findOneService(String businessNo) {
        return mapper.findOne(businessNo);
    }

    public boolean saveService(String businessNo) {
        return mapper.save(businessNo);
    }

    public boolean removeService(String businessNo) {
        return mapper.remove(businessNo);
    }
}
