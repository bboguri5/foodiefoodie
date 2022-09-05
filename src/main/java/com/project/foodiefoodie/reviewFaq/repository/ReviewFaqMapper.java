package com.project.foodiefoodie.reviewFaq.repository;

import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import com.project.foodiefoodie.reviewFaq.dto.ReviewFaqDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewFaqMapper {

    List<ReviewFaq> findAll(String complete);
    ReviewFaq findOne(long reFaqNo);
    boolean update(long reFaqNo, String complete);

    List<ReviewFaqDTO> findAllAndTitle(String complete);

    boolean save(ReviewFaq reviewFaq);


}
