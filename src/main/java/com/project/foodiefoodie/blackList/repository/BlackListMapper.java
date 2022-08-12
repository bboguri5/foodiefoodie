package com.project.foodiefoodie.blackList.repository;

import com.project.foodiefoodie.blackList.domain.BlackList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlackListMapper {

    List<BlackList> findAll();
    BlackList findOne(String email);
    boolean save(String email);
    boolean remove(String email);

}
