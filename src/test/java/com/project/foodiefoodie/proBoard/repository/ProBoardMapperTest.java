package com.project.foodiefoodie.proBoard.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ProBoardMapperTest {

    @Autowired
    ProBoardMapper mapper;

//    @Test
//    void saveTest(){
//
//        ProBoard proBoard = new ProBoard();
//        proBoard.setBusinessNo("101010");
//        proBoard.setTitle("황고기");
//        proBoard.setContent("dkdkdkdkdkdkfajslkflskjdfjskdfjsdlkfjlksdjfljsdlkfjsladkjfjslkdjfajsdfjlksdfds");
//        mapper.save(proBoard);
//
//    }

    @Test
    @DisplayName("title이 황고기이여야 한다.")
    void selectOne()
    {
            ProBoard proBoard = mapper.selectOne(5);
            assertTrue(proBoard.getTitle().equals("황사장"));
    }

    @Test
    @DisplayName("title이 황사장으로 변경된다.")
    void modify()
    {
        ProBoard proBoard = mapper.selectOne(5);
        proBoard.setTitle("황사장");
        boolean modify = mapper.modify(proBoard);
        assertTrue(modify);
    }
    @Test
    @DisplayName("10번 글이 지워져 있댜앙")
    void delete()
    {
        boolean result = mapper.delete(10);
        assertTrue(result);
    }

    @Test
    @DisplayName(" 마스터 이름은 황정아이다.")
    void selectMaster()
    {
        Master master = mapper.selectMaster("101010");
        assertEquals(master.getMasterName(),"황정아");
    }

}