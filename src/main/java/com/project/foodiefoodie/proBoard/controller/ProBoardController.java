package com.project.foodiefoodie.proBoard.controller;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.member.dto.proBoard.StoreTimeDTO;
import com.project.foodiefoodie.proBoard.service.ProBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;https://github.com/bboguri5/foodiefoodie/pull/27/conflict?name=src%252Fmain%252Fjava%252Fcom%252Fproject%252Ffoodiefoodie%252FproBoard%252Fcontroller%252FProBoardController.java&ancestor_oid=849c9a2ccdfeed1e2d800b83cc8ace1b15845894&base_oid=4ab96f8e98b4b79e1a9538f311a9f21317574ec7&head_oid=6afa4c898a76ae1dd2bc64fae38238b993d34a33
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

    @PostMapping("/write")
    public String write(ProBoard proBoard, StoreTimeDTO storeTimeDTO, ImageDTO imageDTO) {
        log.info("foodie/write POST - ! {}",proBoard);
        log.info("foodie/write POST - ! {}",storeTimeDTO);


        return "";
    }
}
