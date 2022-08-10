package com.project.foodiefoodie.blackList.repository;

import com.project.foodiefoodie.blackList.domain.BlackList;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BlackListMapperTest {

    @Autowired
    BlackListMapper mapper;

    @Test
    @DisplayName("전체 조회가 되어야 한다.")
    void findAllTest() {
        List<BlackList> all = mapper.findAll();
        for (BlackList m : all) {
            System.out.println(m);
        }
    }

    @Test
    @DisplayName("해당 이메일이 등록되어야 한다.")
    void saveTest() {
        boolean flag = mapper.save("aaa@naver.com");
        assertTrue(flag);
    }

    @Test
    @DisplayName("해당 객체가 조회되어야 한다.")
    void findOneTest() {
        BlackList one = mapper.findOne("aaa@naver.com");
        System.out.println(one);
    }

    @Test
    @DisplayName("해당 객체가 삭제되어야 한다.")
    void removeTest() {
        boolean flag = mapper.remove("aaa@naver.com");
        assertTrue(flag);
    }
}