package com.project.foodiefoodie.proBoard.repository;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProBoardMapper {


    boolean save (ProBoard proBoard);
    boolean modify(ProBoard proBoard);
    boolean delete(int promotionBno);
    ProBoard selectOne (int promotionBno);
    Master selectMaster(String businessNo);
}
