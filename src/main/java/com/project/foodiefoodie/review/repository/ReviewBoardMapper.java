package com.project.foodiefoodie.review.repository;

import com.project.foodiefoodie.review.dto.AvgStarDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewBoardMapper {

    // 해당 가게 리뷰 게시물 별점 총점 가져오기
    List<AvgStarDTO> avgStarRate();
}
