package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.repository.ReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReviewService {


    private final ReviewMapper mapper;

    public int checkReportCntService(long reviewBno) {
        return mapper.checkReportCnt(reviewBno);
    }

    public boolean reportCntModifyService(int reportCnt, long reviewBno) {
        return mapper.reportCntModify(reportCnt, reviewBno);
    }

    // 리뷰글 좋아요 갯수
    public int reviewLikeCount(Long reviewBno){
        return mapper.reviewLikeCount(reviewBno);
    }

}
