package com.project.foodiefoodie.myPage.controller;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.MasterHotDealOnOffDTO;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.myPage.dto.InputHotDealDTO;
import com.project.foodiefoodie.myPage.dto.ModiHotDealPercentDTO;
import com.project.foodiefoodie.myPage.service.HotDealDiscountService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class HotDealOnOffController {

    private final MasterService masterService;

    private final HotDealDiscountService hotDealDiscountService;


    @PostMapping("/hotDealForm/{masterNum}")
    public String onOffHotDeal(@PathVariable int masterNum , HttpSession session , InputHotDealDTO inputHotDealDTO){
        log.info("\n=============================\n");
        log.info("masterNum ={}",masterNum);
        log.info("hotDealDTO.getHotDealPercent() = {}",inputHotDealDTO.getDiscountPrice());
        log.info("hotDealDTO.getHotDealRadio().getClass().getSimpleName() - type == {}",inputHotDealDTO.getHotDealRadio().getClass().getSimpleName());
        log.info("hotDealDTO.getHotDealRadio() ={}",inputHotDealDTO.getHotDealRadio());
        log.info("/hotDealForm into "); // 여기까지 오는것 성공 !!
        log.info("\n=============================\n");
        Member loginUser = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();
        List<Master> masters = masterService.allMaster(email);
        Master master = masters.get(masterNum);
        // 비즈니스 번호 까지 얻어옴
        String businessNo = master.getBusinessNo();

        //밑에 메서드에 넣어줄 객체를 생성한다
        ModiHotDealPercentDTO modiHotDealPercentDTO = new ModiHotDealPercentDTO();
        //거기에 들어온 인풋값을 넣어준다
        modiHotDealPercentDTO.setBusinessNo(businessNo); // 비즈니스 번호 넣어줌
        modiHotDealPercentDTO.setDiscountPrice(inputHotDealDTO.getDiscountPrice());



        // 마스터 핫딜 값 바꿔주는 DTO 값 넣기
        MasterHotDealOnOffDTO masterHotDealOnOffDTO = new MasterHotDealOnOffDTO();
        masterHotDealOnOffDTO.setBusinessNo(businessNo);
        masterHotDealOnOffDTO.setHotDeal(inputHotDealDTO.getHotDealRadio());// ON OFF 값 넣어줘야됨

        // 마스터정보에있는 마스터 핫딜 값 바꿔주는 메서드
        masterService.masterHotDealOnOffService(masterHotDealOnOffDTO);


        // 일단 ON 인지 OFF 인지 확인
        if(inputHotDealDTO.getHotDealRadio().equals("ON")){
            // 입력값이 ON 값으로 들어왔다면
            log.info("inputHotDealDTO.getHotDealRadio().equals(ON) = {}",inputHotDealDTO.getHotDealRadio().equals("ON"));

            // 일단 있는지 없는지 확인 !
            int i = hotDealDiscountService.hotDealCountService(businessNo);
            log.info("hotDealCount = {}",i);
            if (i == 1){ // 1 이면 있다는 뜻이라서 수정해줘야됨
                boolean modiResult = hotDealDiscountService.hotDealModiService(modiHotDealPercentDTO);

                log.info("ON modiResult = {}" ,modiResult);

                return "redirect:/masterInfo/"+ masterNum;


            } else if (i == 0) {
                // 0 이라는 뜻이라면 없는거라 테이블에 데이터 값을 넣어줘야 함
                boolean insertResult = hotDealDiscountService.insertHotDealService(modiHotDealPercentDTO);

                log.info("insertResult = {}",insertResult);

                return "redirect:/masterInfo/"+ masterNum;
            }


        } else if (inputHotDealDTO.getHotDealRadio().equals("OFF")) {
            // 입력값이 OFF 값으로 들어왔다면
            log.info("inputHotDealDTO.getHotDealRadio().equals(OFF) = {}",inputHotDealDTO.getHotDealRadio().equals("OFF"));

            // discount_price 값이 0 으로 들어오니까 이것도 수정해줘야 된다
            boolean modiResult = hotDealDiscountService.hotDealModiService(modiHotDealPercentDTO);

            log.info("OFF modiResult = {}" ,modiResult);

            return "redirect:/masterInfo/"+ masterNum;

        }


        return "redirect:/masterInfo/"+ masterNum;
    }



}
