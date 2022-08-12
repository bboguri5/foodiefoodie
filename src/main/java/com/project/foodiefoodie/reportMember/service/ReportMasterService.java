package com.project.foodiefoodie.reportMember.service;

import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import com.project.foodiefoodie.reportMember.repository.ReportMasterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReportMasterService {

    private final ReportMasterMapper mapper;


    public List<ReportMaster> findAllService() {
        return mapper.findAll();
    }

    public ReportMaster findOneService(String businessNo) {
        return mapper.findOne(businessNo);
    }

    public boolean saveService(String businessNo) {
        return mapper.save(businessNo);
    }

    public boolean removeService(String businessNo) {
        return mapper.remove(businessNo);
    }

    public boolean modifyService(ReportMaster reportMaster) {
        return mapper.modify(reportMaster);
    }
}
