package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MasterMapper {


    List<Master> findMaster();
    Master findOneMaster(String email);
    boolean removeMaster(String email);

    // 아직 승인 나지 않은 사업자 리스트
    List<Master> approveMaster();

}
