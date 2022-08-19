package com.project.foodiefoodie.member.service;


import com.project.foodiefoodie.member.domain.MasterAndMember;
import com.project.foodiefoodie.member.repository.MasterAndMemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor

public class MasterAndMemberService {

    private final MasterAndMemberMapper mapper;

    // 사업자 전체 조회
    public List<MasterAndMember> findMasterService() {
        List<MasterAndMember> masterList = mapper.findMaster();
        return masterList;
    }

    // 사업자 단일 객체 조회
    public MasterAndMember findOneMasterService(String email) {
        MasterAndMember master = mapper.findOneMaster(email);
        return master;
    }


    // 사업자 신청 이후 승인 처리 안된 리스트
    public List<MasterAndMember> approveMasterService() {
        List<MasterAndMember> masterList = mapper.approveMaster();

        return masterList;

    }

}
