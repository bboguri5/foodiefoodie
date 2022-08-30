package com.project.foodiefoodie.proBoard.repository;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.proBoard.dto.NoticeDTO;
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


    boolean saveProBoardTitleImg(int promotionBno, String titleFilePath, String titleFileName);

    boolean saveNotice(NoticeDTO noticeDTO);

    StoreTimeDTO selectStoreTime(int promotionBno);
    boolean modify(ProBoard proBoard);

    boolean delete(int promotionBno);

    boolean deleteNotice(int noticeNo);

    ProBoard selectOne(int promotionBno);

    int selectPromotionBno(String businessNo);

    Master selectMaster(String businessNo);

    List<ImageDTO> selectImages(int promotionBno,String type);
    List<MenuDTO> selectMenuInfo(int promotionBno);
    List<NoticeDTO> selectNotice(int promotionBno);

    Integer isHotDeal(String businessNo);

}
