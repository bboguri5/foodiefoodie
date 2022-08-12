package com.project.foodiefoodie.reportMember.repository;

import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReportMasterMapperTest {

    @Autowired
    ReportMasterMapper mapper;

    @Test
    @DisplayName("저장되어야 한다.")
    void saveTest() {
        String businessNo = "1111-1111-2222-2222";
        boolean flag = mapper.save(businessNo);
        assertTrue(flag);
    }

    @Test
    @DisplayName("전체 조회 되어야 한다.")
    void findAllTest() {
        List<ReportMaster> all = mapper.findAll();
        for (ReportMaster a : all) {
            System.out.println(a);
        }
    }

    @Test
    @DisplayName("해당 사업자 번호의 내역이 조회되어야 한다.")
    void findOneTest() {
        String businessNo = "1111-1111-2222-2222";
        ReportMaster one = mapper.findOne(businessNo);
        System.out.println(one);
    }

    @Test
    @DisplayName("해당 객체가 수정되어야 한다.")
    void modifyTest() {
        ReportMaster reportMaster = new ReportMaster();
        String businessNo = "1111-1111-2222-2222";
        reportMaster.setReportCnt(2);
        reportMaster.setBusinessNo(businessNo);

        boolean flag = mapper.modify(reportMaster);
        assertTrue(flag);
    }

    @Test
    @DisplayName("해당 객체가 삭제되어야 한다.")
    void removeTest() {
        String businessNo = "1111-1111-2222-2222";
        boolean flag = mapper.remove(businessNo);
        assertTrue(flag);
    }

}