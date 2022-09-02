package com.project.foodiefoodie.replyFaq.repository;

import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.dto.ReplyFaqDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyFaqMapper {
    List<ReplyFaq> findAll(String complete);
    ReplyFaq findOne(long replyFaqNo);
    boolean update(long replyFaqNo, String complete);

    List<ReplyFaqDTO> findAllReply(String complete);

    boolean save(ReplyFaq replyFaq);
}
