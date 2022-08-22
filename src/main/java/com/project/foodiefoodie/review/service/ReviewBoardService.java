package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.promotion.repository.PromotionBoardMapper;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.repository.ReviewBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
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

    public List<ReviewBoardDTO> findAllReviewsService() {
        return rbMapper.findAllReviews();
    }

    public ReviewBoardDTO findOneReviewService(long reviewBno) {
        return rbMapper.findOneReview(reviewBno);
    }

    public List<ReviewUpload> findReviewUploadsService(long reviewBno) {
        return rbMapper.findReviewUploads(reviewBno);
    }
}
