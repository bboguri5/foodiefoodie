package com.project.foodiefoodie.promotionFaq.controller;

import com.project.foodiefoodie.blackList.service.BlackListMasterService;
import com.project.foodiefoodie.blackList.service.BlackListService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import com.project.foodiefoodie.promotion.service.PromotionService;
import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.dto.PromotionFaqDTO;
import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import com.project.foodiefoodie.reportMember.service.ReportMasterService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Objects;

@Controller
@Log4j2
@RequiredArgsConstructor
public class PromotionFaqController {

    private final MasterService ms;
    private final PromotionFaqService pros;
    private final ReportMasterService rms;
    private final PromotionBoardService ps;
    private final BlackListMasterService blms;
    private final BlackListService bls;

    @GetMapping("/admin/promotionFaq")
    public String promotionFaqList(Model model) {

        String F = "F";
        log.info("/admin/promotionFaq GET! - ");
        List<PromotionFaqDTO> promotionFaqDTOList = pros.findAllAndTitleService(F);
        model.addAttribute("proFaqList", promotionFaqDTOList);
        log.info("promotionFaqList - {}", promotionFaqDTOList);
        return "admin/promotionFaq";
    }

    @PostMapping("/admin/promotion-completeFaq")
    @Transactional
    public String completeFaq(PromotionFaq promotionFaq, String completeType) {

        log.info("/admin/faq-completeFaq POST! - {}", promotionFaq);

        // ?????? ?????? ??????
        if (Objects.equals(completeType, "N")) {
            pros.updateService(promotionFaq.getPrFaqNo(), "N");
        } else if (Objects.equals(completeType, "T")) { // ?????? ?????? ??????
            pros.updateService(promotionFaq.getPrFaqNo(), "T");
            ReportMaster reportMaster = rms.findOneService(promotionFaq.getBusinessNo());
            // ??????????????? ????????? ????????? ??????
            // ????????? ?????????
            if (reportMaster == null) {
                // ????????? ??????
                rms.saveService(promotionFaq.getBusinessNo());
            } else { // ????????? ?????? ???
                if (reportMaster.getReportCnt() >= 5) {
                    return "redirect:/admin/promotionFaq";
                }
                // ????????? + 1
                int newReportCnt = reportMaster.getReportCnt() + 1;
                reportMaster.setReportCnt(newReportCnt);
                rms.modifyService(reportMaster);

                if (newReportCnt == 5) {
                    // ?????????????????? ??????
                    blms.saveService(promotionFaq.getBusinessNo());
                    // ?????? ????????? ?????? ?????? (???????????? ?????????)
                    ms.removeMasterService(promotionFaq.getBusinessNo());
                }
            }

            // ?????? ???????????? ?????????
            if (ps.findOneService(promotionFaq.getBusinessNo()) != null) {
                // ???????????? ????????? ??????
                int reportCnt = ps.checkReportCnt(promotionFaq.getBusinessNo());
                if (ms.findOneForBusinessNoService(promotionFaq.getBusinessNo()) != null) {
                    ps.reportCntModifyService(reportCnt + 1, promotionFaq.getBusinessNo());
                }
            }
        }

        return "redirect:/admin/promotionFaq";
    }

}
