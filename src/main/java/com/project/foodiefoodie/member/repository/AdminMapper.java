package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.dto.AuthDTO;
import com.project.foodiefoodie.member.dto.PromotionAuthDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

    boolean authChange(AuthDTO dto);

    boolean promotionAuthChange(PromotionAuthDTO authDTO);
}
