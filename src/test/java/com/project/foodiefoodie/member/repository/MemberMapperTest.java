package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberMapperTest {

//    List<Member> findAll();
//    List<Member> findCommon(String auth);
//    List<Master> findMaster(String auth);
//    Member findOneCommon(String email, String auth);
//    Master findOneMaster(String email, String auth);
//    boolean remove(String email);

    @Autowired
    MemberMapper mapper;


    @Test
    @DisplayName("유저 전체 조회가 되어야 한다.")
    void findAllTest() {
        List<Member> memberList = mapper.findAll();

        for (Member member : memberList) {
            System.out.println(member);
        }
    }

    @Test
    @DisplayName("일반유저 전체가 조회되어야 한다.")
    void findCommonTest() {
        List<Member> memberList = mapper.findCommon();
        for (Member m : memberList) {
            System.out.println(m);
        }
    }

    @Test
    @DisplayName("사업자 전체가 조회되어야 한다.")
    void findMasterTest() {
        List<Master> memberList = mapper.findMaster();

        for (Master m : memberList) {
            System.out.println(m);
        }
    }

    @Test
    @DisplayName("해당 이메일의 일반유저가 조회되어야 한다.")
    void findOneCommonTest() {
        String email = "bbbb2222@naver.com";
        Member member = mapper.findOneCommon(email);
        System.out.println(member);
    }


    @Test
    @DisplayName("해당 이메일의 사업자가 조회되어야 한다.")
    void findOneMasterTest() {
        String email = "abc1234@naver.com";
        Master member = mapper.findOneMaster(email);
        System.out.println(member);
    }

    @Test
    @DisplayName("해당 이메일의 유저가 삭제되어야 한다.")
    void removeTest() {
        mapper.remove("acdd1234@naver.com");
    }

    @Test
    @DisplayName("마스터객체만 삭제되어야 한다.")
    void removeMasterTest() {
        mapper.removeMaster("acdd1234@naver.com");
    }

    @Test
    @DisplayName("아직 승인나지 않은 사업자가 조회되어야 한다.")
    void approveMasterTest() {
        List<Master> masterList = mapper.approveMaster();
        for (Master m : masterList) {
            System.out.println(m);
        }
    }

}