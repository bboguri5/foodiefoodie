package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.domain.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberServiceTest {

    @Autowired
    MemberService memberService;

    @Test
    void commonList() {
        List<Member> commonService = memberService.findCommonService();

        for (Member m : commonService) {
            System.out.println(m);
        }
    }

}