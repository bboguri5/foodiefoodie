package com.project.foodiefoodie.promotionFaq.service;

import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.repository.PromotionFaqMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PromotionFaqService {

    private final PromotionFaqMapper mapper;

    public List<PromotionFaq> findAllService() {
        List<PromotionFaq> promotionFaqList = mapper.findAll();
        return promotionFaqList;
    }

    public PromotionFaq findOneService(long prFaqNo) {
        PromotionFaq promotionFaq = mapper.findOne(prFaqNo);
        return promotionFaq;
    }
}
