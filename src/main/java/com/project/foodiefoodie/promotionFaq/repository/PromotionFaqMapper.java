package com.project.foodiefoodie.promotionFaq.repository;

import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PromotionFaqMapper {
    List<PromotionFaq> findAll(String complete);
    PromotionFaq findOne(long prFaqNo);
    boolean update(long prFaqNo, String complete);

}
