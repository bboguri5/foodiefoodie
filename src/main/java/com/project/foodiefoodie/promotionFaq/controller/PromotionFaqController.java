package com.project.foodiefoodie.promotionFaq.controller;

import com.project.foodiefoodie.promotion.service.PromotionService;
import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import com.project.foodiefoodie.reportMember.service.ReportMasterService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Objects;

@Controller
@Log4j2
@RequiredArgsConstructor
public class PromotionFaqController {

    private final PromotionFaqService pros;
    private final ReportMasterService rms;
    private final PromotionService ps;

    @GetMapping("/admin/promotionFaq")
    public String promotionFaqList(Model model) {

        String F = "F";
        log.info("/admin/promotionFaq GET! - ");
        List<PromotionFaq> promotionFaqList = pros.findAllService(F);
        model.addAttribute("proFaqList", promotionFaqList);
        log.info("promotionFaqList - {}", promotionFaqList);
        return "admin/promotionFaq";
    }

    @PostMapping("/admin/promotion-completeFaq")
    public String completeFaq(PromotionFaq promotionFaq, String completeType) {

        log.info("/admin/faq-completeFaq POST! - {}", promotionFaq);

        // 거절 버튼 클릭
        if (Objects.equals(completeType, "N")) {
            pros.updateService(promotionFaq.getPrFaqNo(), "N");
        } else if (Objects.equals(completeType, "T")) { // 승인 버튼 클릭
            pros.updateService(promotionFaq.getPrFaqNo(), "T");
            ReportMaster reportMaster = rms.findOneService(promotionFaq.getBusinessNo());
            // 불량이용자 목록에 있는지 확인
            // 목록에 없을때
            if (reportMaster == null) {
                // 목록에 추가
                rms.saveService(promotionFaq.getBusinessNo());
            } else { // 목록에 있을 때
                // 카운트 + 1
                reportMaster.setReportCnt(reportMaster.getReportCnt() + 1);
                rms.modifyService(reportMaster);
            }

            // 홍보글에 카운트 추가
            int reportCnt = ps.checkReportCnt(promotionFaq.getBusinessNo());
            ps.reportCntModifyService(reportCnt + 1, promotionFaq.getBusinessNo());
        }

        return "redirect:/admin/promotionFaq";
    }

}
