package com.project.foodiefoodie.replyFaq.repository;

import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyFaqMapperTest {

    @Autowired
    ReplyFaqMapper mapper;

    @Test
    @DisplayName("댓글 신고 리스트를 불러와야 한다.")
    void findAllTest() {
        List<ReplyFaq> list = mapper.findAll();
        for (ReplyFaq i : list) {
            System.out.println(i);
        }
    }

    @Test
    @DisplayName("해당 댓글 신고 객체를 불러와야 한다.")
    void findOneTest() {
        ReplyFaq one = mapper.findOne(1);
        System.out.println(one);
    }

}