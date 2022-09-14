package com.project.foodiefoodie.promotionFaq.controller;

import com.project.foodiefoodie.blackList.service.BlackListMasterService;
import com.project.foodiefoodie.blackList.service.BlackListService;
import com.project.foodiefoodie.member.service.MasterService;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.promotion.service.PromotionBoardService;
import com.project.foodiefoodie.promotionFaq.domain.PromotionFaq;
import com.project.foodiefoodie.promotionFaq.service.PromotionFaqService;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.service.ReplyFaqService;
import com.project.foodiefoodie.reportMember.domain.ReportMaster;
import com.project.foodiefoodie.reportMember.domain.ReportMember;
import com.project.foodiefoodie.reportMember.service.ReportMasterService;
import com.project.foodiefoodie.reportMember.service.ReportMemberService;
import com.project.foodiefoodie.review.service.ReviewBoardService;
import com.project.foodiefoodie.review.service.ReviewService;
import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
import com.project.foodiefoodie.reviewFaq.service.ReviewFaqService;
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
public class CompleteFaqController {

    private final PromotionFaqService profs;
    private final ReviewFaqService reviewfs;
    private final ReplyFaqService replyfs;
    private final ReportMasterService rms;
    private final BlackListMasterService blms;
    private final PromotionBoardService ps;
    private final MasterService ms;

    private final MemberService memberService;
    private final ReviewFaqService rvfs;
    private final ReportMemberService reportMemberService;
    private final ReviewService rs;
    private final ReviewBoardService rbs;
    private final BlackListService bls;

    private final ReplyFaqService rfs;
    private final ReplyService replyService;

    @GetMapping("/admin/completeFaq")
    public String completeFaqList(Model model) {

        log.info("/admin/completeFaq GET! - ");


        String T = "T";
        List<PromotionFaq> promotionFaqList = profs.findAllService(T);
        List<ReviewFaq> reviewFaqList = reviewfs.findAllService(T);
        List<ReplyFaq> replyFaqList = replyfs.findAllService(T);

        model.addAttribute("promotionFaqList", promotionFaqList);
        model.addAttribute("reviewFaqList", reviewFaqList);
        model.addAttribute("replyFaqList", replyFaqList);

        log.info("promotionFaqList - {}", promotionFaqList);
        log.info("reviewFaqList - {}", reviewFaqList);
        log.info("replyFaqList - {}", replyFaqList);


        return "admin/complete-faq";
    }

    @PostMapping("/admin/promotion-completeFaq-cancel")
    @Transactional
    public String completeFaq(PromotionFaq promotionFaq, String completeType) {

        log.info("/admin/faq-completeFaq-cancel POST! - {}", promotionFaq);

        // 거절 버튼 클릭
        if (Objects.equals(completeType, "N")) {
            profs.updateService(promotionFaq.getPrFaqNo(), "N");
            ReportMaster reportMaster = rms.findOneService(promotionFaq.getBusinessNo());

            if (reportMaster == null) {
                return "redirect:/admin/completeFaq";
            } else {
                // 블랙리스트에 있으면 삭제
                if (reportMaster.getReportCnt() == 5) {
                    blms.removeService(promotionFaq.getBusinessNo());
                }
                // 카운트 - 1
                int newReportCnt = reportMaster.getReportCnt() - 1;
                reportMaster.setReportCnt(newReportCnt);
                rms.modifyService(reportMaster);
            }

            // 해당 홍보글이 있으면
            if (ps.findOneService(promotionFaq.getBusinessNo()) != null) {
                // 홍보글에 카운트 - 1
                int reportCnt = ps.checkReportCnt(promotionFaq.getBusinessNo());
                if (ms.findOneForBusinessNoService(promotionFaq.getBusinessNo()) != null) {
                    ps.reportCntModifyService(reportCnt - 1, promotionFaq.getBusinessNo());
                }
            }
        }
        return "redirect:/admin/completeFaq";
    }

    @PostMapping("/admin/review-completeFaq-cancel")
    public String completeFaq(ReviewFaq reviewFaq , String completeType) {

        log.info("/admin/review-completeFaq-cancel POST! - {}", reviewFaq);

        // 거절 버튼 클릭
        if (Objects.equals(completeType, "N")) {
            rvfs.updateService(reviewFaq.getReFaqNo(), "N");


            ReportMember reportMember = reportMemberService.findOneService(reviewFaq.getReviewWriterEmail());

            if (reportMember == null) {
                return "redirect:/admin/completeFaq";
            } else {
                // 블랙리스트에 있으면 삭제
                if (reportMember.getReportCnt() == 5) {
                    bls.removeService(reviewFaq.getReviewWriterEmail());
                }

                // 카운트 - 1
                int newReportCnt = reportMember.getReportCnt() - 1;
                reportMember.setReportCnt(newReportCnt);
                reportMemberService.modifyService(reportMember);

            }
            // 해당 리뷰글이 있으면
            if (rbs.findOneReviewService(reviewFaq.getReviewBno()) != null) {
                // 리뷰글에 카운트 - 1
                int reportCnt = rs.checkReportCntService(reviewFaq.getReviewBno());
                if (rbs.findOneReviewService(reviewFaq.getReviewBno()) != null) {
                    rs.reportCntModifyService(reportCnt - 1, reviewFaq.getReviewBno());
                }
            }
        }

        return "redirect:/admin/completeFaq";
    }

    @PostMapping("/admin/reply-completeFaq-cancel")
    @Transactional
    public String completeFaq(ReplyFaq replyFaq, String completeType) {

        log.info("/admin/reply-completeFaq POST! - {}", replyFaq);

        // 거절 버튼 클릭
        if (Objects.equals(completeType, "N")) {
            rfs.updateService(replyFaq.getReplyFaqNo(), "N");

            ReportMember reportMember = reportMemberService.findOneService(replyFaq.getReplyWriterEmail());
            // 불량이용자 목록에 있는지 확인
            // 목록에 없을때
            if (reportMember == null) {
                return "redirect:/admin/completeFaq";
            } else { // 목록에 있을 때
                if (reportMember.getReportCnt() == 5) {
                    bls.removeService(replyFaq.getReplyWriterEmail());
                }

                // 카운트 - 1
                int newReportCnt = reportMember.getReportCnt() - 1;
                reportMember.setReportCnt(newReportCnt);
                reportMemberService.modifyService(reportMember);
            }

        }

        return "redirect:/admin/completeFaq";
    }

}
