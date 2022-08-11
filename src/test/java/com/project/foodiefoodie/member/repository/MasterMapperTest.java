package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.dto.master.MasterDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MasterMapperTest {

    @Autowired
    MasterMapper mapper;

    @Test
    @DisplayName("일치하는 주소를 가진 마스터 정보를 가져와야 한다")
    void findLocationRandTest() {
        List<MasterDTO> list = mapper.findLocationRand("서울 금천구");
        System.out.println(list);
    }


    @Test
    @DisplayName("일치하는 마스터 정보를 가져와야 한다")
    void getMasterInfoTest() {
        MasterDTO master =  mapper.getMasterInfo("1234-2222-3333-1119");
        System.out.println(master);
    }


}