package com.project.foodiefoodie.premiume.repository;

import com.project.foodiefoodie.premiume.domain.Premiume;
import com.project.foodiefoodie.premiume.dto.PremiumeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PremiumeMapper {
    List<Premiume> findAll(String complete);
    boolean save(Premiume premiume);
    boolean remove(long promotionBno);
    boolean modify(Premiume premiume);

    List<PremiumeDTO> findAllAndTitle(String complete);
}
