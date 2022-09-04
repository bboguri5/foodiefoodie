package com.project.foodiefoodie.reply.repository;

import com.project.foodiefoodie.common.paging.Page;
import com.project.foodiefoodie.reply.domain.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {

    boolean remove(long replyNo);

    List<Reply> findAllReplies(long reviewBno);

    List<Reply> findAll(@Param("reviewBno") Long reviewBno
            , @Param("page") Page page);

    Reply findOne(long replyNo);

    int findReplyCount(long reviewBno);

    boolean save(Reply reply);

    boolean modify(Reply reply);

    // 리뷰 번호당 리뷰 댓글 갯수 가져옴
    int replyCount(long reviewBno);






}
