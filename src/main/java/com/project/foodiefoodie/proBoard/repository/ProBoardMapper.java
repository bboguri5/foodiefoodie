package com.project.foodiefoodie.proBoard.repository;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProBoardMapper {

    boolean saveProBoard(ProBoard proBoard);

    boolean saveProBoardStoreTime(int promotionBno, StoreTimeDTO storeTimeDTO);

    boolean saveProBoardMenu(int promotionBno,MenuDTO menuDTO);

    boolean saveProBoardImage(int promotionBno, ImageDTO imageDTO);

    List<Integer> selectMenuNo(int promotionBno);

    boolean saveProBoardTitleImg(int promotionBno, String titleFilePth, String titleFileName);

    boolean modify(ProBoard proBoard);

    boolean delete(int promotionBno);

    ProBoard selectOne(int promotionBno);

    int selectPromotionBno(String businessNo);

    Master selectMaster(String businessNo);

    MenuDTO selectMenu(int promotionBno);

}
