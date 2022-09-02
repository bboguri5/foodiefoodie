package com.project.foodiefoodie.proBoard.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.util.List;

@SpringBootTest
class ProBoardFileMapperTest {


    @Autowired
    ProBoardMapper proBoardMapper;

//    @Test
//    void saveFilesTest()
//    {
//        proBoardMapper.saveProBoardMenu(44,"밥",1000);
//        boolean result = proBoardFileMapper.saveFiles( new FileDTO(44,new File("C:\\foodiefoodie\\proBoard\\1234-11-12345\\menu\\1013171_1651842338741_31533.jpg")));
//        System.out.println(result);
//    }
//    @Test
//    @DisplayName(" 마슽터 / 게시판작성정보 / 파일 다 가져옴 ")
//    void selectProBoardTest()
//    {
//        ProBoard proBoard = proBoardMapper.selectProBoard(56);
//        System.out.println(proBoard.getFileName());
//    }
//
//    @Test
//    @DisplayName("menu 파일 저옵 다 가 고 옴 ")
//    void selectMenuInfoTest()
//    {
//        List<MenuDTO> menuDTOS = proBoardMapper.selectMenuInfo(56);
//
//        for(MenuDTO menu : menuDTOS )
//        {
//            System.out.println(menu.getFileName());
//        }
//    }


}