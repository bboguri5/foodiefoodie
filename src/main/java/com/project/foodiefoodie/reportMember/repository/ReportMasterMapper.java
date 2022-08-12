package com.project.foodiefoodie.reportMember.repository;

import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMasterMapper {

    List<ReportMaster> findAll();
    ReportMaster findOne(String businessNo);
    boolean save(String businessNo);
    boolean remove(String businessNo);
    boolean modify(ReportMaster ReportMaster);

}
