package com.project.foodiefoodie.reply.repository;

import com.project.foodiefoodie.reply.domain.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyMapperTest {

    @Autowired
    ReplyMapper mapper;

    @Test
    @DisplayName("삭제되어야 한다.")
    @Rollback
    void removeTest() {
        boolean flag = mapper.remove(1);
        assertTrue(flag);
    }

//    @Test
//    void findAllTest() {
//        List<Reply> all =  mapper.findAll();
//        for (Reply reply : all) {
//            System.out.println(reply);
//        }
//    }

    @Test
    void findOneTest() {
        Reply one = mapper.findOne(3);
        System.out.println(one);
    }


    @Test
    @DisplayName("리뷰 번호 주면 총 댓글수 가져다줌")
    void countReplyTest(){
        long num = 1;

        int i = mapper.replyCount(num);
        System.out.println("\n\n=====\n\n");
        System.out.println(i);
        System.out.println("\n\n=====\n\n");


    }

}