package com.project.foodiefoodie.master.service;

import com.project.foodiefoodie.master.dto.MasterDTO;
import com.project.foodiefoodie.master.repository.MasterMapper;
import com.project.foodiefoodie.review.dto.AvgStarDTO;
import com.project.foodiefoodie.review.repository.ReviewBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MasterService {

    private final MasterMapper mapper;

    public MasterDTO getMasterInfo(String businessNo) {
        return mapper.getMasterInfo(businessNo);
    }
}
