package com.project.foodiefoodie.reviewFaq.controller;

import com.project.foodiefoodie.blackList.service.BlackListService;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.promotion.service.PromotionService;
import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import com.project.foodiefoodie.reportMember.domain.ReportMember;
import com.project.foodiefoodie.reportMember.service.ReportMasterService;
import com.project.foodiefoodie.reportMember.service.ReportMemberService;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import com.project.foodiefoodie.review.service.ReviewService;
import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import com.project.foodiefoodie.reviewFaq.dto.ReviewFaqDTO;
import com.project.foodiefoodie.reviewFaq.service.ReviewFaqService;
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
public class ReviewFaqController {

    private final MemberService ms;
    private final ReviewFaqService rvfs;
    private final ReportMemberService rms;
    private final ReviewService rs;
    private final ReviewBoardService rbs;
    private final BlackListService bls;

    @GetMapping("/admin/reviewFaq")
    public String reviewFaqList(Model model) {

        String F = "F";
        log.info("/admin/reviewFaq GET! - ");

        List<ReviewFaqDTO> reviewFaqDTOList = rvfs.findAllAndTitleService(F);
        model.addAttribute("reviewFaqList", reviewFaqDTOList);
        log.info("reviewFaqList - {}", reviewFaqDTOList);
        return "admin/reviewFaq";
    }


    @PostMapping("/admin/review-completeFaq")
    public String completeFaq(ReviewFaq reviewFaq , String completeType) {

        log.info("/admin/review-completeFaq POST! - {}", reviewFaq);

        // ?????? ?????? ??????
        if (Objects.equals(completeType, "N")) {
            rvfs.updateService(reviewFaq.getReFaqNo(), "N");
        } else if (Objects.equals(completeType, "T")) { // ?????? ?????? ??????
            rvfs.updateService(reviewFaq.getReFaqNo(), "T");

            ReportMember reportMember = rms.findOneService(reviewFaq.getReviewWriterEmail());
            log.info("reportMember - {}", reportMember);
            // ??????????????? ????????? ????????? ??????
            // ????????? ?????????
            if (reportMember == null) {
                // ????????? ??????

                rms.saveService(reviewFaq.getReviewWriterEmail());
            } else { // ????????? ?????? ???
                log.info("reportCnt - {}", reportMember.getReportCnt());
                if (reportMember.getReportCnt() >= 5) {
                    return "redirect:/admin/reviewFaq";
                }

                // ????????? + 1
                int newReportCnt = reportMember.getReportCnt() + 1;
                reportMember.setReportCnt(newReportCnt);
                rms.modifyService(reportMember);

                if (newReportCnt == 5) {
                    // ?????????????????? ??????
                    bls.saveService(reviewFaq.getReviewWriterEmail());
                    // ?????? ?????? ??????
                    ms.removeService(reviewFaq.getReviewWriterEmail());
                }

            }
            // ?????? ???????????? ?????????
            if (rbs.findOneReviewService(reviewFaq.getReviewBno()) != null) {
                // ???????????? ????????? ??????
                log.info("reviewBno - {}", rbs.findOneReviewService(reviewFaq.getReviewBno()));
                int reportCnt = rs.checkReportCntService(reviewFaq.getReviewBno());
                if (rbs.findOneReviewService(reviewFaq.getReviewBno()) != null) {
                    rs.reportCntModifyService(reportCnt + 1, reviewFaq.getReviewBno());
                }
            }

        }

        return "redirect:/admin/reviewFaq";
    }

}
