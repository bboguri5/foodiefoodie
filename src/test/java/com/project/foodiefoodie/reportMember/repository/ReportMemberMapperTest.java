package com.project.foodiefoodie.reportMember.repository;

import com.project.foodiefoodie.reportMember.domain.ReportMember;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReportMemberMapperTest {

//    List<ReportMember> findAll();
//    ReportMember findOne(String email);
//    boolean save(String email);
//    boolean remove(String email);
//    boolean modify(ReportMember reportMember);
    @Autowired
    ReportMemberMapper mapper;

    @Test
    @DisplayName("등록되어야 한다.")
    void saveTest() {
        String email = "acdd1234@naver.com";
        boolean flag = mapper.save(email);
        assertTrue(flag);
    }

    @Test
    @DisplayName("리스트 전체 불러와야 한다.")
    void findAllTest() {
        List<ReportMember> all = mapper.findAll();
        for (ReportMember a : all) {
            System.out.println(a);
        }
    }

    @Test
    @DisplayName("해당 이메일의 객체가 삭제되어야 한다.")
    void removeTest() {
        String email = "acdd1234@naver.com";
        boolean flag = mapper.remove(email);
        assertTrue(flag);
    }

    @Test
    @DisplayName("수정되어야 한다.")
    void modifyTest() {
        ReportMember m = new ReportMember();
        String email = "acdd1234@naver.com";
        m.setEmail(email);
        m.setReportCnt(2);
        System.out.println(m);
        boolean flag = mapper.modify(m);
        assertTrue(flag);
    }

    @Test
    @DisplayName("해당 객체를 불러와야 한다.")
    void findOneTest() {
        String email = "acdd1234@naver.com";
        ReportMember member = mapper.findOne(email);
        System.out.println(member);
    }
}