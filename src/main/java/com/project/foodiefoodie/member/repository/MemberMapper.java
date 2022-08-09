package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {

    List<Member> findAll();
    List<Member> findCommon();
    List<Master> findMaster();
    Member findOneCommon(String email);
    Master findOneMaster(String email);
    boolean remove(String email);
    // 아직 승인 나지 않은 사업자 리스트
    List<Master> approveMaster();

    boolean removeMaster(String email);


}
