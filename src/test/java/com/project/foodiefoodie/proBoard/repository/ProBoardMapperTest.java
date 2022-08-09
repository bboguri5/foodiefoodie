package com.project.foodiefoodie.proBoard.repository;

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

    @Test
    void saveTest(){

        ProBoard proBoard = new ProBoard();
        proBoard.setBusinessNo("101010");
        proBoard.setTitle("황고기");
        proBoard.setContent("dkdkdkdkdkdkfajslkflskjdfjskdfjsdlkfjlksdjfljsdlkfjsladkjfjslkdjfajsdfjlksdfds");
        mapper.save(proBoard);
    }

}