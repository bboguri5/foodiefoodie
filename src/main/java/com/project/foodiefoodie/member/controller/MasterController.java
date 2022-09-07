package com.project.foodiefoodie.member.controller;

import com.project.foodiefoodie.blackList.domain.BlackListMaster;
import com.project.foodiefoodie.blackList.service.BlackListMasterService;
import com.project.foodiefoodie.member.domain.Auth;
import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.member.dto.MasterModifyDTO;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.metal.MetalMenuBarUI;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MasterController {

    private final MasterService masterService;

    private final BlackListMasterService blackListMasterService;

    private final PromotionBoardService promotionBoardService;

    private final MemberService memberService;

    // 사업자 등록 화면 요청 처리
    @GetMapping("/master/register")
    public String requestAuthMaster() {
        return "member/master/request-auth";
    }


    // 사업자 번호 중복 비동기 처리
    @GetMapping("/master/check")
    @ResponseBody
    public ResponseEntity<String> duplicateBusinessNo(String businessNo) {

        BlackListMaster findBlackUser = blackListMasterService.findOneService(businessNo);

        if (findBlackUser == null) { // 블랙 리스트에 등록된 사업자 번호가 아닌 경우 
            boolean flag = masterService.duplicateBusinessNo(businessNo);

            if (flag) { // 중복된 사업자 번호인 경우
                return new ResponseEntity<>("duplicate", HttpStatus.OK);
            }

            return new ResponseEntity<>("possible", HttpStatus.OK);
        }

        // 블랙리스트로 등록된 사업자 번호인 경우
        return new ResponseEntity<>("blackList", HttpStatus.OK);
    }


    // 실질적 사업자 등록 요청 처리
    @PostMapping("/request-auth")
    public String requestAuthMaster(Master master, RedirectAttributes ra) {

        log.info("/request-auth POST!! -{}", master);


        boolean flag = masterService.requestAuthMaster(master);

        if (flag) {
            return "member/master/request-success";
        }

        ra.addFlashAttribute("resultMsg", "fail");

        return "redirect:/request-auth";
    }

    @GetMapping("/masterInfo/{masterNum}")
    public String masterInfo(@PathVariable int masterNum, HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();
        log.info("\n\n=====\n\n");
        log.info("welcome /masterInfo -loginUser-Auth :?? {}", loginUser.getAuth());
        List<Master> masters = masterService.allMaster(email);
        Master master = masters.get(masterNum);
        String businessNo = master.getBusinessNo();
        model.addAttribute("masterNum", masterNum);
        model.addAttribute("master", master);
        // promotion넘버를 가져와야됨
        // 안썼으면 안나오니까 이거 무작정 주지말고 if 로 묶어서 줌
        Integer proBoardNumService = promotionBoardService.findProBoardNumService(businessNo);

        log.info("proboard = {}", proBoardNumService);
        if (proBoardNumService != null) {
            model.addAttribute("promotionBno", proBoardNumService);
        }
        return "myPage/masterInfo";
    }


    @GetMapping("/masterInfoModi/{masterNum}")
    public String masterInfoModi(@PathVariable int masterNum, HttpSession session, Model model) {

        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();


        log.info("welcome /masterInfoModi -loginUser-Auth :?? {}", loginUser.getAuth());


        List<Master> masters = masterService.allMaster(email);
        for (Master master : masters) {
            log.info(master);

        }

        Master master = masters.get(masterNum);
        log.info(master);

        model.addAttribute("master", master);
        model.addAttribute("masterNum", masterNum);

        return "/myPage/masterInfoModi";
    }

    @PostMapping("/masterModiPost/{masterNum}")
    public String masterSuccessModi(@PathVariable int masterNum, HttpSession session, MasterModifyDTO masterModifyDTO) {
        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();// 이메일 찾기
        boolean b = masterService.masterModiService(masterModifyDTO);

        //
        List<Master> masterList = (List<Master>) session.getAttribute("masterList");
        Master master = masterList.get(masterNum);
        master.setStoreName(masterModifyDTO.getStoreName());


//        return "/masterInfo/"+masterNum;
        return "redirect:/masterInfo/" + masterNum;
    }


    // 마스터 정보 삭제하기 컨트롤러 !!
    @PostMapping("/delMaster/{masterNum}")
    public String deleteMasterInfo(@PathVariable int masterNum, HttpSession session) {

        log.info("im - delMaster masterNum {}", masterNum);
        Member loginUser = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);
        String email = loginUser.getEmail();

        List<Master> masters = masterService.allMaster(email);
        Master master = masters.get(masterNum);
        String businessNo = master.getBusinessNo();
        log.info("businessNo  = {}", businessNo);
        // 마스터 넘으로 마스터 번호까지 추출했음

        // 마스터의 숫자 (가게 갯수)
        int i = masterService.masterCountService(email);

        if (i > 0) {
            // 세션에서 마스터 삭제하고
            List<Master> masterList = (List<Master>) session.getAttribute("masterList");
            // 세션에서 삭제
            masterList.remove(masterNum);
            // db 에서 삭제하고
            masterService.deleteMasterService(businessNo);
            i--;
        }
        if(i == 0) {
            log.info("else");
            // db 권한 내림
            memberService.authDownCommonTest(email);
            //
            loginUser.setAuth(Auth.COMMON);
        }


        return "redirect:/myPage/profile";

    }

}
