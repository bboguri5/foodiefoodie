package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.dto.FavoriteListDTO;
import com.project.foodiefoodie.member.repository.FavoriteListMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class FavoriteListService {

    private final FavoriteListMapper favoriteListMapper;

    public List<FavoriteListDTO> favoriteListService(String email){
        log.info("email ============ {}",email);
        List<FavoriteListDTO> favorites = favoriteListMapper.favoriteList(email);
        return favorites;
    }



}
