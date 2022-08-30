package com.project.foodiefoodie.proBoard.repository;

import com.project.foodiefoodie.proBoard.dto.FileDTO;
import org.apache.ibatis.annotations.Mapper;

import java.io.File;

@Mapper
public interface ProBoardFileMapper {

    boolean saveFileTitle(FileDTO fileDTO);
    boolean saveFileDetail(FileDTO fileDTO);
    boolean saveFileMenu(FileDTO fileDTO);
}
