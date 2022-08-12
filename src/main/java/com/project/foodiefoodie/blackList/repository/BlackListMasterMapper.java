package com.project.foodiefoodie.blackList.repository;

import com.project.foodiefoodie.blackList.domain.BlackListMaster;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlackListMasterMapper {

    List<BlackListMaster> findAll();
    BlackListMaster findOne(String businessNo);
    boolean save(String businessNo);
    boolean remove(String businessNo);


}
