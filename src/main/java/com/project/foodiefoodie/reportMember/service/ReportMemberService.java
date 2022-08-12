package com.project.foodiefoodie.reportMember.service;

import com.project.foodiefoodie.reportMember.domain.ReportMember;
import com.project.foodiefoodie.reportMember.repository.ReportMemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReportMemberService {
    private final ReportMemberMapper mapper;

//    List<ReportMember> findAll();
//    ReportMember findOne(String email);
//    boolean save(String email);
//    boolean remove(String email);
//    boolean modify(ReportMember reportMember);

    public List<ReportMember> findAllService() {
        return mapper.findAll();
    }

    public ReportMember findOneService(String email) {
        return mapper.findOne(email);
    }

    public boolean saveService(String email) {
        return mapper.save(email);
    }

    public boolean removeService(String email) {
        return mapper.remove(email);
    }

    public boolean modifyService(ReportMember reportMember) {
        return mapper.modify(reportMember);
    }
}
