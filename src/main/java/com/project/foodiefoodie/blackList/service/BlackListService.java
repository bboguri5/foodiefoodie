package com.project.foodiefoodie.blackList.service;

import com.project.foodiefoodie.blackList.domain.BlackList;
import com.project.foodiefoodie.blackList.repository.BlackListMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BlackListService {


    private final BlackListMapper mapper;

    // 일반회원 블랙리스트
    public List<BlackList> findAllService() {
        return mapper.findAll();
    }

    // 이메일로 단일 객체 조회
    public BlackList findOneService(String email) {
        return mapper.findOne(email);
    }

    // 일반회원 블랙리스트 등록
    public boolean saveService(String email) {
        return mapper.save(email);
    }

    // 일반회원 블랙리스트 삭제
    public boolean removeService(String email) {
        return mapper.remove(email);
    }
}
