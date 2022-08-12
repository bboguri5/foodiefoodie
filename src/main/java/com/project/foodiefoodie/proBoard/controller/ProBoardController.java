package com.project.foodiefoodie.proBoard.controller;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.service.ProBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/foodie")
public class ProBoardController {

    private final ProBoardService proBoardService;

    @GetMapping("/detail")
    public String detail() {
        log.info(" foodie/detail Get - ! ");
        return "promotion/pro-detail";
    }

    @GetMapping("/write/{businessNo}")
    public String write(Model model, @PathVariable String businessNo){
        log.info("foodie/write Get - ! {} ",businessNo);
        Master master = proBoardService.selectMaster(businessNo);
        log.info(master);
        model.addAttribute("master",master);
        return "promotion/pro-write";
    }


//    @GetMapping("/write")
//    public String write(Model model,String businessNo){
//        log.info("foodie/write Get - ! {} ",businessNo);
//        Master master = proBoardService.selectMaster(businessNo);
//        model.addAttribute("master",master);
//        return "promotion/pro-write";
//    }


    // 동진 : 임의 매핑이에요!
    @PostMapping("/write")
    public String promoWrite(ProBoard proBoard,ImageDTO imgDTO) {

        

        return "";
    }
}
