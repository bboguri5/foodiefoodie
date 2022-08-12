package com.project.foodiefoodie.blackList.repository;

import com.project.foodiefoodie.blackList.domain.BlackListMaster;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BlackListMasterMapperTest {

    @Autowired
    BlackListMasterMapper mapper;


    @Test
    @DisplayName("리스트 전체를 불러와야 한다.")
    void findAllTest() {
        List<BlackListMaster> all = mapper.findAll();
        for (BlackListMaster a : all) {
            System.out.println(a);
        }
    }

    @Test
    @DisplayName("저장되어야 한다.")
    void saveTest() {
        boolean flag = mapper.save("1111-2222-3333-2222");
        assertTrue(flag);
    }

    @Test
    @DisplayName("해당 사업자 번호의 블랙 리스트를 가져와야 한다.")
    void findOneTest() {
        BlackListMaster one = mapper.findOne("1111-2222-3333-2222");
        System.out.println(one);
    }

    @Test
    @DisplayName("해당 사업자 번호의 블랙리스트가 삭제되어야 한다.")
    void removeTest() {
        boolean flag = mapper.remove("1111-2222-3333-2222");
        assertTrue(flag);
    }

}