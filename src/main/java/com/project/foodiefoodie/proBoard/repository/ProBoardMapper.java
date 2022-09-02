package com.project.foodiefoodie.proBoard.repository;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface ProBoardMapper {

    boolean saveProBoard(ProBoard proBoard);

    boolean saveStoreTime(ProBoard proBoard);


    boolean modifyProBoard(ProBoard proBoard);
    boolean modifyStoreTime(ProBoard proBoard );

//    boolean modifyMenuInfo(MenuDTO menuDTO);
//    boolean deleteFileOneInfo(int promotionBno, String fileName, String type);
//    boolean deleteProBoard(int promotionBno);

    Master selectMaster(String businessNo);

    int selectPromotionBno(String businessNo);

    ProBoard selectProBoard(int promotionBno);


    /* ============================= file =============================== */

    List<FileDTO> selectFiles(int promotionBno, String type);

    boolean deleteFileAllInfo(int promotionBno, String type);

    boolean saveFiles(FileDTO fileDTO);

    /* ============================= menu =============================== */
    boolean saveMenuInfo(MenuDTO menuDTO);

    List<MenuDTO> selectMenuInfo(int promotionBno);
    boolean deleteMenuInfo(int promotionBno);

    /* ============================= notice =============================== */
    boolean saveNotice(NoticeDTO noticeDTO);

    List<NoticeDTO> selectNotice(int promotionBno);

    boolean deleteNotice(int noticeNo);

    Integer isHotDeal(String businessNo);
}
