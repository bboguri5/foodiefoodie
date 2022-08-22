package com.project.foodiefoodie.premiume.controller;

import com.project.foodiefoodie.premiume.domain.Premiume;
import com.project.foodiefoodie.premiume.service.PremiumeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class premiumeController {

    private final PremiumeService pres;

    @GetMapping("admin/premiume-F")
    public String premiumeListF(Model model) {

//        log.info("premiume-F GET! - ");

        List<Premiume> premiumeF = pres.findAllService("F");
        model.addAttribute("premiumeF", premiumeF);
//        log.info("premiumeF - {}", premiumeF);


        return "admin/premiume-F";
    }

    @PostMapping("admin/premiume-complete")
    public String premiumeComplete(Premiume premiume) {

        log.info("premiume-complete POST! - {}", premiume);

        pres.modifyService(premiume);

        return "redirect:/admin/premiume-F";
    }

    @GetMapping("admin/premiume-T")
    public String premiumeListT(Model model) {
//        log.info("premiume-T GET! - ");

        List<Premiume> premiumeT = pres.findAllService("T");
        model.addAttribute("premiumeT", premiumeT);


        return "admin/premiume-T";
    }


}
