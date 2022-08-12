package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.repository.MasterMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class MasterService {

    private final MasterMapper mapper;

    public List<MasterAndMember> findMasterService() {
        List<MasterAndMember> masterList = mapper.findMaster();
        return masterList;
    }

    public MasterAndMember findOneMasterService(String email) {
        MasterAndMember master = mapper.findOneMaster(email);
        return master;
    }

    public boolean removeMasterService(String email) {
        boolean flag = mapper.removeMaster(email);
        return flag;
    }

    public List<MasterAndMember> approveMaster() {
        List<MasterAndMember> masterList = mapper.approveMaster();

        return masterList;
    }

}
