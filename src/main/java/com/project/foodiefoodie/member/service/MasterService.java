package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.repository.MasterMapper;
import com.project.foodiefoodie.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class MasterService {

    private final MasterMapper mapper;

    public List<Master> findMasterService() {
        List<Master> masterList = mapper.findMaster();
        return masterList;
    }

    public Master findOneMasterService(String email) {
        Master master = mapper.findOneMaster(email);
        return master;
    }

    public boolean removeMasterService(String email) {
        boolean flag = mapper.removeMaster(email);
        return flag;
    }

    public List<Master> approveMaster() {
        List<Master> masterList = mapper.approveMaster();

        return masterList;
    }

}
