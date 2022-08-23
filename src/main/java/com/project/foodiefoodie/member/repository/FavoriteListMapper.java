package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.dto.FavoriteListDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavoriteListMapper {


    // 내가 즐겨찾는 리스트
    List<FavoriteListDTO> favoriteList(String email);



}
