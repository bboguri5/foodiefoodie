package com.project.foodiefoodie.proBoard.controller;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import com.project.foodiefoodie.proBoard.service.ProBoardService;
import com.project.foodiefoodie.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.*;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/foodie")
public class ProBoardController {

    private final ProBoardService proBoardService;
    public  final String UPLOAD_PATH = "C:\\foodiefoodie\\upload";

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
    public String write(ProBoard proBoard, StoreTimeDTO storeTimeDTO ,
                        List<MultipartFile> titleImgFile,
                        List<MultipartFile> detailImgFiles ,
                        List<MultipartFile> menuImgFiles) {
        log.info("foodie/write POST - ! {}",proBoard);
        log.info("foodie/write POST - ! {}",storeTimeDTO);
        log.info("foodie/write POST!! - titleImgFile : {}", titleImgFile.get(0).getOriginalFilename());
        log.info("foodie/write POST!! - detailImgFiles : {}", detailImgFiles.get(0).getOriginalFilename());
        log.info("foodie/write POST!! - menuImgFiles : {}", menuImgFiles.get(0).getOriginalFilename());

        Map<String,List<MultipartFile>> fileMap = new HashMap<>(){{
            put("title",titleImgFile);
            put("detail",detailImgFiles);
            put("menu",menuImgFiles);
        }};


        proBoardService.uploadMasterFile(fileMap, UPLOAD_PATH, proBoard.getBusinessNo());

        return "";
    }

    @PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<List<String>> ajaxUpload(List<MultipartFile> imgs) {

        if (imgs != null) {
            log.info("/ajax-upload POST!! - {}", imgs);

            List<String> fileNames = new ArrayList<>();
            return new ResponseEntity<>(fileNames, HttpStatus.OK);
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
