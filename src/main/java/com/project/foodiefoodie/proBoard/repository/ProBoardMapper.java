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

    boolean saveFiles(FileDTO fileDTO);

    boolean modify(ProBoard proBoard);

    boolean delete(int promotionBno);

    Master selectMaster(String businessNo);

    int selectPromotionBno(String businessNo);

    ProBoard selectProBoard(int promotionBno);

    List<FileDTO> selectFiles(int promotionBno, String type);

    /* ============================= menu =============================== */
    boolean saveMenu(int promotionBno, String menuName, int menuPrice);

    List<MenuDTO> selectMenuInfo(int promotionBno);

    /* ============================= notice =============================== */
    boolean saveNotice(NoticeDTO noticeDTO);

    List<NoticeDTO> selectNotice(int promotionBno);

    boolean deleteNotice(int noticeNo);


}
