package com.project.foodiefoodie.reviewFaq.service;

import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import com.project.foodiefoodie.reviewFaq.dto.ReviewFaqDTO;
import com.project.foodiefoodie.reviewFaq.repository.ReviewFaqMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReviewFaqService {

    private final ReviewFaqMapper mapper;

    public List<ReviewFaq> findAllService(String complete) {
        List<ReviewFaq> reviewFaqList = mapper.findAll(complete);
        return reviewFaqList;
    }

    public ReviewFaq findOneService(long reFaqNo) {
        ReviewFaq reviewFaq = mapper.findOne(reFaqNo);
        return reviewFaq;
    }

    public boolean updateService(long reFaqNo, String complete) {
        return mapper.update(reFaqNo, complete);
    }

    public List<ReviewFaqDTO> findAllAndTitleService(String complete) {
        return mapper.findAllAndTitle(complete);
    }

}
