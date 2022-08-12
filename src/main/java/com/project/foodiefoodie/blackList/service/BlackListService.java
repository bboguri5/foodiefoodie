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

//    List<BlackList> findAll();
//    BlackList findOne(String email);
//    boolean save(String email);
//    boolean remove(String email);


    private final BlackListMapper mapper;

    public List<BlackList> findAllService() {
        return mapper.findAll();
    }

    public BlackList findOneService(String email) {
        return mapper.findOne(email);
    }

    public boolean saveService(String email) {
        return mapper.save(email);
    }

    public boolean removeService(String email) {
        return mapper.remove(email);
    }
}
