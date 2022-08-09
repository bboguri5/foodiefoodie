package com.project.foodiefoodie.member.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper mapper;

    public List<Member> findAllService() {
        List<Member> memberList = mapper.findAll();
        return memberList;
    }

    public List<Member> findCommonService() {
        List<Member> memberList = mapper.findCommon();
        return memberList;
    }

    public List<Master> findMasterService() {
        List<Master> masterList = mapper.findMaster();
        return masterList;
    }

    public Member findOneCommonService(String email) {
        Member member = mapper.findOneCommon(email);
        return member;
    }

    public Master findOneMasterService(String email) {
        Master master = mapper.findOneMaster(email);
        return master;
    }

    public boolean removeService(String email) {
        boolean flag = mapper.remove(email);
        return flag;
    }

}
