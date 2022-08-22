package com.project.foodiefoodie.promotionFaq.service;

import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.dto.PromotionFaqDTO;
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

    public List<PromotionFaq> findAllService(String complete) {
        List<PromotionFaq> promotionFaqList = mapper.findAll(complete);
        return promotionFaqList;
    }

    public PromotionFaq findOneService(long prFaqNo) {
        PromotionFaq promotionFaq = mapper.findOne(prFaqNo);
        return promotionFaq;
    }

    public boolean updateService(long prFaqNo, String complete) {
        return mapper.update(prFaqNo, complete);
    }

    public List<PromotionFaqDTO> findAllAndTitleService(String complete) {
        return mapper.findAllAndTitle(complete);
    }
}
