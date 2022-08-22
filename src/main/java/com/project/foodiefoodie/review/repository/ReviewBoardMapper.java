package com.project.foodiefoodie.review.repository;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.AvgStarDTO;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewBoardMapper {

    // 리뷰 게시글 쓰기
    boolean save(ReviewBoard review);

    // 해당 가게 평점 구하기
    double getStarRate(String businessNo);

    // 해당 가게 리뷰 개수 구하기
    Long getReviewCnt(String businessNo);

//    // 해당 가게 리뷰 게시물 별점 총점 가져오기
//    List<AvgStarDTO> avgStarRate();

    List<ReviewBoardDTO> findAllReviews();

    ReviewBoardDTO findOneReview(long reviewBno);

    List<ReviewUpload> findReviewUploads(long reviewBno);

    void reviewUpload(long reviewBno, String filePath, String fileName);
}
