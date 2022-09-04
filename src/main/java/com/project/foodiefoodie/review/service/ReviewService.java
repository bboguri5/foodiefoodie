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

    public int checkReportCntService(String email) {
        return mapper.checkReportCnt(email);
    }

    public boolean reportCntModifyService(int reportCnt, String email) {
        return mapper.reportCntModify(reportCnt, email);
    }
}
