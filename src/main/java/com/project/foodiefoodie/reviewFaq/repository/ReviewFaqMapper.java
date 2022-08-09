package com.project.foodiefoodie.reviewFaq.repository;

import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewFaqMapper {

    List<ReviewFaq> findAll();
    ReviewFaq findOne(long reFaqNo);
}
