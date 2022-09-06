package com.project.foodiefoodie.replyFaq.controller;

import com.project.foodiefoodie.blackList.service.BlackListService;
import com.project.foodiefoodie.member.service.MemberService;
import com.project.foodiefoodie.reply.domain.Reply;
import com.project.foodiefoodie.reply.service.ReplyService;
import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.dto.ReplyFaqDTO;
import com.project.foodiefoodie.replyFaq.service.ReplyFaqService;
import com.project.foodiefoodie.reportMember.domain.ReportMember;
import com.project.foodiefoodie.reportMember.service.ReportMemberService;
import com.project.foodiefoodie.reviewFaq.domain.ReviewFaq;
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
public class ReplyFaqController {

    private final ReplyFaqService rfs;
    private final ReportMemberService rms;
    private final ReplyService rs;
    private final BlackListService bls;
    private final MemberService ms;


    @GetMapping("/admin/replyFaq")
    public String replyFaqList(Model model) {

        log.info("/admin/replyFaq GET! - ");
        String F = "F";
        List<ReplyFaqDTO> replyFaqDTOList = rfs.findAllReplyService(F);



        model.addAttribute("replyFaqList", replyFaqDTOList);
        log.info("replyFaqList - {}", replyFaqDTOList);



        return "admin/replyFaq";
    }


    @PostMapping("/admin/reply-completeFaq")
    @Transactional
    public String completeFaq(ReplyFaq replyFaq, String completeType) {

        log.info("/admin/reply-completeFaq POST! - {}", replyFaq);

        // 거절 버튼 클릭
        if (Objects.equals(completeType, "N")) {
            rfs.updateService(replyFaq.getReplyFaqNo(), "N");
        } else if (Objects.equals(completeType, "T")) { // 승인 버튼 클릭
            rfs.updateService(replyFaq.getReplyFaqNo(), "T");

            ReportMember reportMember = rms.findOneService(replyFaq.getReplyWriterEmail());
            // 불량이용자 목록에 있는지 확인
            // 목록에 없을때
            if (reportMember == null) {
                // 목록에 추가
                rms.saveService(replyFaq.getReplyWriterEmail());
            } else { // 목록에 있을 때
                if (reportMember.getReportCnt() >= 5) {
                    return "redirect:/admin/replyFaq";
                }

                // 카운트 + 1
                int newReportCnt = reportMember.getReportCnt() + 1;
                reportMember.setReportCnt(newReportCnt);
                rms.modifyService(reportMember);

                if (newReportCnt == 5) {
                    // 블랙리스트에 등록
                    bls.saveService(replyFaq.getReplyWriterEmail());
                    // 해당 계정 탈퇴
                    ms.removeService(replyFaq.getReplyWriterEmail());
                }
            }

            if (rs.findOneService(replyFaq.getReplyNo()) != null) {
                // 댓글 삭제
                rs.removeService(replyFaq.getReplyNo());
            }

        }

        return "redirect:/admin/replyFaq";
    }


}
