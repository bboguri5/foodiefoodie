package com.project.foodiefoodie.master.repository;

import com.project.foodiefoodie.master.dto.MasterDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MasterMapper {

    // 메인 페이지를 위한 특정 마스터 테이블 정보를 가져와야 한다
    MasterDTO getMasterInfo(String businessNo);
}
