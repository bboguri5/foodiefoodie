package com.project.foodiefoodie.replyFaq.service;

import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.repository.ReplyFaqMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReplyFaqService {

    private final ReplyFaqMapper mapper;

    public List<ReplyFaq> findAllService() {
        List<ReplyFaq> replyFaqList = mapper.findAll();
        return replyFaqList;
    }

    public ReplyFaq findOneService(long replyFaqNo) {
        ReplyFaq replyFaq = mapper.findOne(replyFaqNo);
        return replyFaq;
    }
}
