package com.project.foodiefoodie.reply.repository;

import com.project.foodiefoodie.reply.domain.Reply;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ReplyMapper {

    boolean remove(long replyNo);

    List<Reply> findAllReplies(long reviewBno);

    List<Reply> findAll();

    Reply findOne(long replyNo);

    int findReplyCount(long reviewBno);
}
