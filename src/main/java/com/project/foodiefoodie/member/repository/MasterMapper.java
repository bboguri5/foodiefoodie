package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.dto.BusinessNoAndPromotionNoDTO;
import com.project.foodiefoodie.member.dto.MasterHotDealOnOffDTO;
import com.project.foodiefoodie.member.dto.MasterModifyDTO;
import com.project.foodiefoodie.promotion.dto.PromotionMasterDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.project.foodiefoodie.member.domain.MasterAndMember;

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
    // 메인 페이지에 현재 위치 주소와 맞는 TOP 7 랜덤 식당 불러오기
    List<PromotionMasterDTO> findLocationRand(String storeAddress);

    List<PromotionMasterDTO> findAllInLocation(@Param("storeAddress") String storeAddress, @Param("page")Page page);

    int getMyTotalCnt(String storeAddress);

    // 해당 마스터만 삭제

    // boolean removeMaster(String businessNo);

    Master findOneMasterForBusinessNo(String businessNo);

  List<Master> callMaster(String email);

    int masterCount(String email);

    boolean masterModi(MasterModifyDTO masterModifyDTO);

    BusinessNoAndPromotionNoDTO findPromotionBno(String businessNo);

    boolean MasterHotDealOnOff(MasterHotDealOnOffDTO masterHotDealOnOffDTO);


    // 마스터삭제하기
    boolean deleteMaster(String businessBno);

    // 비즈니스 번호 주면 이메일 뱉어냄
    String findEmail(String businessBno);


}
