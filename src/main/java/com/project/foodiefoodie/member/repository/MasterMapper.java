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

    // 메인 페이지를 위한 특정 마스터 테이블 정보를 가져와야 한다
    MasterDTO getMasterInfo(String businessNo);


    // 권한 요청을 하면 일단은 Master 테이블에 기록되어야 한다. 반려처리되면 거기서 삭제되는 식!
    boolean requestAuthMaster(Master master);


    // 사업자 번호 중복 확인용
    int findBusinessNo(String businessNo);

    // 메인 페이지에 현재 위치 주소와 맞는 TOP 7 랜덤 식당 불러오기
    List<PromotionMasterDTO> findLocationRand(String storeAddress);

    List<PromotionMasterDTO> findAllInLocation(@Param("storeAddress") String storeAddress, @Param("page")Page page);

    int getMyTotalCnt(String storeAddress);

    // 해당 마스터만 삭제
    boolean removeMaster(String businessNo);

}
