package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {

    List<Member> findAll();
    List<Member> findCommon(String auth);
    List<Master> findMaster(String auth);
    Member findOneCommon(String email);
    Master findOneMaster(String email);
    boolean remove(String email);

}
