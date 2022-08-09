package com.project.foodiefoodie.reviewFaq.service;

import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
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

    public List<ReviewFaq> findAllService() {
        List<ReviewFaq> reviewFaqList = mapper.findAll();
        return reviewFaqList;
    }

    public ReviewFaq findOneService(long reFaqNo) {
        ReviewFaq reviewFaq = mapper.findOne(reFaqNo);
        return reviewFaq;
    }
}
