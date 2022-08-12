package com.project.foodiefoodie.reply.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {

    boolean remove(long replyNo);

}
