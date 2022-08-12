package com.project.foodiefoodie.premiume.service;

import com.project.foodiefoodie.premiume.domain.Premiume;
import com.project.foodiefoodie.premiume.repository.PremiumeMapper;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PremiumeService {

//    List<Premiume> findAll();
//    boolean save(Premiume premiume);
//    boolean remove(long promotionBno);
//    boolean modify(Premiume premiume);


    private final PremiumeMapper mapper;

    public List<Premiume> findAllService() {
        List<Premiume> premiumeList = mapper.findAll();
        return premiumeList;
    }

    public boolean saveService(Premiume premiume) {
        boolean flag = mapper.save(premiume);
        return flag;
    }

    public boolean removeService(long promotionBno) {
        boolean flag = mapper.remove(promotionBno);
        return flag;
    }

    public boolean modifyService(Premiume premiume) {
        boolean flag = mapper.modify(premiume);
        return flag;
    }

}
