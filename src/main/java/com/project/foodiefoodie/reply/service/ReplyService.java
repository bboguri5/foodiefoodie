package com.project.foodiefoodie.reply.service;


import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.common.paging.PageMaker;
import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.repository.ReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReplyService {

    private final ReplyMapper mapper;

    public boolean removeService(long replyNo) {
        return mapper.remove(replyNo);
    }

    public List<Reply> findAllRepliesService(long reviewBno) {
        return mapper.findAllReplies(reviewBno);
    }

    public List<Reply> findAllService(long reviewBno, Page page) {
        return mapper.findAll(reviewBno, page);
    }

    public Reply findOneService(long replyNo) {
        return mapper.findOne(replyNo);
    }

    public int findReplyCountService(long reviewBno) {
        return mapper.findReplyCount(reviewBno);
    }

    public Map<String, Object>  getList(Long reviewBno, Page page) {
        //댓글 목록 조회
        PageMaker maker = new PageMaker(page, getCount(reviewBno));

        Map<String, Object> replyMap = new HashMap<>();
        replyMap.put("replyList", mapper.findAll(reviewBno, page));
        replyMap.put("maker", maker);
        replyMap.put("count",getCount(reviewBno));

        return replyMap;
    }

    //댓글 총 개수 조회
    public int getCount(Long reviewBno) {
        return mapper.findReplyCount(reviewBno);
    }

    //댓글 쓰기 중간처리
    public boolean write(Reply reply) {
        return mapper.save(reply);
    }
}
