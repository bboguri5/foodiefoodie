package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.project.foodiefoodie.member.domain.MasterAndMember;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MasterMapper {

    // 권한 요청을 하면 일단은 Master 테이블에 기록되어야 한다. 반려처리되면 거기서 삭제되는 식!
    boolean requestAuthMaster(Master master);


    // 사업자 번호 중복 확인용
    int findBusinessNo(String businessNo);

    List<MasterAndMember> findMaster();
    MasterAndMember findOneMaster(String email);
    boolean removeMaster(String email);

    // 아직 승인 나지 않은 사업자 리스트
    List<MasterAndMember> approveMaster();

}
