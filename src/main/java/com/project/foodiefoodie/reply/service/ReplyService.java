package com.project.foodiefoodie.reply.service;


import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.repository.ReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReplyService {

    private final ReplyMapper mapper;

    public boolean removeService(long replyNo) {
        return mapper.remove(replyNo);
    }

    public List<Reply> findAllService() {
        return mapper.findAll();
    }

    public Reply findOneService(long replyNo) {
        return mapper.findOne(replyNo);
    }
}
