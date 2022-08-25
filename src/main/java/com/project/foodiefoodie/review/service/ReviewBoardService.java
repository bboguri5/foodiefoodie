package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.promotion.repository.PromotionBoardMapper;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.repository.ReviewBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardService {

    private final ReviewBoardMapper rbMapper;
    private final PromotionBoardMapper pbMapper;

//    public List<AvgStarDTO> avgStarRateService() {
//        return mapper.avgStarRate();
//    }

    @Transactional
    public boolean saveService(ReviewBoard reviewBoard) {
        // mapper.save

        // 리뷰 등록할 때 가게 평점 & 리뷰 개수 업데이트 해주기
        boolean flag = rbMapper.save(reviewBoard);
        if (flag) {
            String businessNo = reviewBoard.getBusinessNo();

            double avgStarRate = rbMapper.getStarRate(businessNo);
            Long reviewCnt = rbMapper.getReviewCnt(businessNo);

            System.out.println("starRate & reviewCnt = " + avgStarRate + " & " + reviewCnt);
            return pbMapper.updateRateAndCount(businessNo, avgStarRate, reviewCnt);
        }

        return false;
    }

    public List<ReviewBoardDTO> findAllReviewsService(String sort) {
        List<ReviewBoardDTO> allReviews = rbMapper.findAllReviews(sort);
        return allReviews;
    }

    public List<ReviewBoardDTO> searchAllReviewService(String search, String sort) {
//        log.info("search - {}", search);
        return rbMapper.searchAllReview(search, sort);
    }

    public ReviewBoardDTO findOneReviewService(long reviewBno) {
        return rbMapper.findOneReview(reviewBno);
    }

    public List<ReviewUpload> findReviewUploadsService(long reviewBno) {
        return rbMapper.findReviewUploads(reviewBno);
    }

    public boolean upLikeService(long reviewBno) {
        return rbMapper.upLike(reviewBno);
    }

    public int getLikeService(long reviewBno) {
        return rbMapper.getLike(reviewBno);
    }

    public boolean isLikedService(long reviewBno, String email) {
        int liked = rbMapper.isLiked(reviewBno, email);
        log.info("liked returned int - {}", liked >= 1);
        return liked >= 1;
    }

    public boolean downLikeService(long reviewBno) {
        return rbMapper.downLike(reviewBno);
    }

    public boolean saveReviewLikeService(long reviewBno, String email) {
        return rbMapper.saveReviewLike(reviewBno, email);
    }

    public boolean deleteReviewLikeService(long reviewBno, String email) {
        return rbMapper.deleteReviewLike(reviewBno, email);
    }
}
