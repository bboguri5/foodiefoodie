package com.project.foodiefoodie.proBoard.controller;


import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.FileDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.proBoard.dto.NoticeDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import com.project.foodiefoodie.proBoard.service.ProBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.*;


@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/proBoard")
public class ProBoardController {

    private final ProBoardService proBoardService;

    @GetMapping("/detail/{promotionBno}")
    public String detail(Model model, @PathVariable int promotionBno) {
        log.info(" ProBoardController /detail/{} Get - ! ", promotionBno);

        model.addAttribute("proBoard", proBoardService.selectProBoard(promotionBno));
        model.addAttribute("menuList", proBoardService.selectMenuInfo(promotionBno));
        model.addAttribute("detailFiles",proBoardService.selectFiles(promotionBno,"detail"));
        model.addAttribute("title",proBoardService.selectFiles(promotionBno,"title").get(0));
        model.addAttribute("noticeDTOS", proBoardService.selectNotice(promotionBno));
        return "promotion/pro-detail";
    }


    @GetMapping("/detail/notice/show/{promotionBno}")
    @ResponseBody
    public List<NoticeDTO> showAgainDetailNotice(@PathVariable int promotionBno) {
        List<NoticeDTO> noticeDTOS = proBoardService.selectNotice(promotionBno);
        log.info("ProBoardController /detail/noticeShow/{} Get - ! noticeDOTS : {} ", promotionBno, noticeDTOS);
        return noticeDTOS;
    }


    @PostMapping("/detail/notice/save")
    @ResponseBody
    public String saveDetailNotice(@RequestBody NoticeDTO noticeDTO) {
        log.info("ProBoardController /detail/noticeSave POST - ! {}", noticeDTO);
        boolean result = proBoardService.saveNotice(noticeDTO);
        return result ? "insert-success" : "insert-failed";
    }

    @DeleteMapping("/detail/notice/delete/{noticeNo}")
    @ResponseBody
    public String deleteDetailNotice(@PathVariable int noticeNo) {
        log.info("/detail/noticeDelete/{} controller RequestBody ", noticeNo);
        boolean result = proBoardService.deleteNotice(noticeNo);
        return result ? "delete-success" : "delete-failed";
    }

    //    ---------------------------------------- write ----------------------------------------
    @GetMapping("/write/{businessNo}")
    public String write(HttpSession session, Model model, @PathVariable String businessNo) {

//        로그인 X , 관리자 X 일 경우 접근 불가.
//        if(!(LoginUtils.isLogin(session) && LoginUtils.getCurrentMemberAuth(session) == "MASTER"))
//        {
//            return "redirect:/login";
//        }

        log.info("foodie/write Get - ! {} ", businessNo);
        model.addAttribute("master", proBoardService.selectMaster(businessNo));
        return "promotion/pro-write";
    }

    @PostMapping("/write")
    public String write(HttpServletRequest request, ProBoard proBoard,
                        List<MultipartFile> titleImgFile,
                        List<MultipartFile> detailImgFiles,
                        List<MultipartFile> menuImgFiles) {

        log.info("foodie/write POST - ! {}", proBoard);
        log.info("foodie/write POST!! - titleImgFile : {}", titleImgFile.get(0).getOriginalFilename());
        log.info("foodie/write POST!! - detailImgFiles : {}", detailImgFiles.get(0).getOriginalFilename());
        log.info("foodie/write POST!! - menuImgFiles : {}", menuImgFiles.get(0).getOriginalFilename());

        List<String[]> menuList = new ArrayList<>(Arrays.asList(
                    request.getParameterValues("menuName"),
                    request.getParameterValues("menuPrice")
        ));

        Map<String, List<MultipartFile>> fileMap = new HashMap<>() {{
            put("title", titleImgFile);
            put("detail", detailImgFiles);
            put("menu", menuImgFiles);
        }};

        boolean proBoardSaveResult = proBoardService.saveProBoard(proBoard, menuList, fileMap);
        return "";
    }

    //    ---------------------------------------- modify ----------------------------------------

    @GetMapping("/modify/{promotionBno}")
    public String modify(HttpSession session, Model model, @PathVariable int promotionBno) {

        //        로그인 X , 관리자 X 일 경우 접근 불가.
//        if(!(LoginUtils.isLogin(session) && LoginUtils.getCurrentMemberAuth(session) == "MASTER"))
//        {
//            return "redirect:/login";
//        }

        model.addAttribute("proBoard", proBoardService.selectProBoard(promotionBno));

        return "promotion/pro-modify";
    }

    @GetMapping("/modify/files/{promotionBno}")
    @ResponseBody
    public Map<String,Object> modifyFiles(@PathVariable int promotionBno)
    {
        String[] fileType = {"title","detail"};
        Map<String,Object> infoMap = new HashMap<>();
        for(String type : fileType)
        {
            infoMap.put(type,proBoardService.selectFiles(promotionBno,type));
        }

        infoMap.put("menuList",proBoardService.selectMenuInfo(promotionBno));

        return infoMap;
    }


    @PostMapping("/modify")
    public String modify(HttpServletRequest request, ProBoard proBoard,
                        List<MultipartFile> titleImgFile,
                        List<MultipartFile> detailImgFiles,
                        List<MultipartFile> menuImgFiles) {


        System.out.println("진입");
        log.info("proBoard/modify POST - ! {}", proBoard);
        log.info("proBoard/modify POST!! - titleImgFile : {}", titleImgFile.get(0).getOriginalFilename());
        log.info("proBoard/modify POST!! - detailImgFiles : {}", detailImgFiles.get(0).getOriginalFilename());
        log.info("proBoard/modify POST!! - menuImgFiles : {}", menuImgFiles.get(0).getOriginalFilename());

        List<String[]> menuList = new ArrayList<>(Arrays.asList(
                request.getParameterValues("menuName"),
                request.getParameterValues("menuPrice")
        ));
        Map<String, List<MultipartFile>> fileMap = new HashMap<>() {{
            put("title", titleImgFile);
            put("detail", detailImgFiles);
            put("menu", menuImgFiles);
        }};

        boolean proBoardModifyResult = proBoardService.modifyProBoard(proBoard, menuList, fileMap);
        return "";
    }

    @PostMapping("/modify/menu")
    @ResponseBody
    public String modifyMenu(@RequestBody List<MenuDTO> menuDTOList)
    {
        log.info(" @PostMapping(\"/modify/menu\") modifyMenu {}",menuDTOList);

        return "";
    }


}
