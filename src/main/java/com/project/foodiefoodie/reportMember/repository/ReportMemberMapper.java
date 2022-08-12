package com.project.foodiefoodie.reportMember.repository;

import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.reportMember.domain.ReportMember;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMemberMapper {

    List<ReportMember> findAll();
    ReportMember findOne(String email);
    boolean save(String email);
    boolean remove(String email);
    boolean modify(ReportMember reportMember);


}
