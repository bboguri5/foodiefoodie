package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.repository.ProBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.sound.sampled.Port;

@Service
@RequiredArgsConstructor
public class ProBoardService {

    private final ProBoardMapper proBoardMapper;

    public boolean save(ProBoard proBoard) {

        return proBoardMapper.save(proBoard);
    }

    public boolean modify(ProBoard proBoard) {
        return proBoardMapper.modify(proBoard);
    }

    public boolean delete(int promotionBno) {
        return proBoardMapper.delete(promotionBno);
    }

    public ProBoard selectOne(int promotionBno) {
        return proBoardMapper.selectOne(promotionBno);
    }

    public Master selectMaster(String businessNo)
    {
        return proBoardMapper.selectMaster(businessNo);
    }

}
