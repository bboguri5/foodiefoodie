package com.project.foodiefoodie.promotion.controller;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MiniPromotionBoardController {

    private final PromotionBoardService promotionBoardService;
    private final MasterService masterService;

    @GetMapping("/countProBoard/{masterNum}")
    @ResponseBody
    public String CountMyProBoard(@PathVariable int masterNum, HttpSession session , Model model){
        Member loginUser = (Member)session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();
        List<Master> masters = masterService.allMaster(email);
        Master master = masters.get(masterNum);
        String businessNo = master.getBusinessNo();

        int i = promotionBoardService.countPromotionBoardService(businessNo);
        model.addAttribute("countBoard",i);

        if (i == 0) {
            return "yes";
        } else {
            return "no";
        }

    }
}
