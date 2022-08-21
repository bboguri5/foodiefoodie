package com.project.foodiefoodie.proBoard.repository;

import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

@SpringBootTest
class ProBoardMapperTest {

    @Autowired
    ProBoardMapper proMapper;

    @Test
    @DisplayName("proboard 정보가 저장되어야 한다.")
    void saveTest() {
        ProBoard proBoard = new ProBoard();
        proBoard.setBusinessNo("1234-12-12345");
        proBoard.setTitle("황고기");
        proBoard.setContent("맛있다.");
        proBoard.setHashTag("중국");
        proBoard.setFilePath("파일경로");
        proBoard.setFileName("파일이름");
        System.out.println(proBoard);
        proMapper.saveProBoard(proBoard);

    }
//
//    @Test
//    @DisplayName("storeTime이 저장되어야 한다.")
//    void saveProBoardStoreTimeTest() {
//        StoreTimeDTO storeTime = new StoreTimeDTO(
//                2,
//                800, 1800,
//                800, 1800,
//                1630, 1700,
//                "화,수"
//        );
//
//        System.out.println(storeTime);
//        proMapper.saveProBoardStoreTime(storeTime);
//    }

    @Test
    @DisplayName("menu가 저장되어야 한다.")
    void saveProBoardMenuTest() {

        proMapper.saveProBoardMenu(3, "짜장면", 3000);
        proMapper.saveProBoardMenu(3, "짬뽕", 5000);
        proMapper.saveProBoardMenu(3, "탕수육", 7000);

    }

    @Test
    @DisplayName("menu가 조회되어야 한다.")
    void saveProBoardMenu2Test() {

        MenuDTO menuDTO = proMapper.selectMenu(3);
        System.out.println(menuDTO);
    }

    @Test
    @DisplayName("menu no List가 조회되어야 한다.")
    void selectMenuNoTest() {
        List<Integer> dd = proMapper.selectMenuNo(3);
        System.out.println(dd);
    }

    //
    @Test
    @DisplayName("type에 맞게 저장되어야 한다.")
    void saveProBoardImageTest() {

        ImageDTO imageDTO = new ImageDTO();
        imageDTO.setFileName("a");
        imageDTO.setFilePath("b");
        imageDTO.setType("detail");
        imageDTO.setMenuNo(0);
        proMapper.saveProBoardImage(3, imageDTO);

//        for (int menuNo : proMapper.selectMenuNo(3)) {
//            System.out.println(menuNo);
//            imageDTO.setMenuNo(menuNo);
//            proMapper.saveProBoardImage(3, imageDTO);
//        }
    }

//
//    @Test
//    @DisplayName("title이 황고기이여야 한다.")
//    void selectOne()
//    {
//            ProBoard proBoard = mapper.selectOne(5);
//            assertTrue(proBoard.getTitle().equals("황사장"));
//    }
//
//    @Test
//    @DisplayName("title이 황사장으로 변경된다.")
//    void modify()
//    {
//        ProBoard proBoard = mapper.selectOne(5);
//        proBoard.setTitle("황사장");
//        boolean modify = mapper.modify(proBoard);
//        assertTrue(modify);
//    }
//    @Test
//    @DisplayName("10번 글이 지워져 있댜앙")
//    void delete()
//    {
//        boolean result = mapper.delete(10);
//        assertTrue(result);
//    }
//
//    @Test
//    @DisplayName(" 마스터 이름은 황정아이다.")
//    void selectMaster()
//    {
//        Master master = mapper.selectMaster("101010");
//        assertEquals(master.getMasterName(),"황정아");
//    }

}