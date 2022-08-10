package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.review.dto.AvgStarDTO;
import com.project.foodiefoodie.review.repository.ReviewBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewBoardService {

    private final ReviewBoardMapper mapper;

    public List<AvgStarDTO> avgStarRateService() {
        return mapper.avgStarRate();
    }
}
