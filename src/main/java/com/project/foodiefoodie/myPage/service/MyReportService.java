package com.project.foodiefoodie.myPage.service;

import com.project.foodiefoodie.myPage.dto.*;
import com.project.foodiefoodie.myPage.repository.MyPageMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class MyReportService {

    private final MyPageMapper myPageMapper;

//    // 리뷰 신고 리스트 불러오기
//    public List<ReviewReportDTO> reviewReportDTOListService(String email) {
//
//        log.info(" public List<ReviewReportDTO> reviewReportDTOListService(String email) ");
//
//        List<ReviewReportDTO> reviewReportDTOS = myPageMapper.reviewReportDTOList(email);
//        log.info("\n====\n");
//        for (ReviewReportDTO reviewReportDTO : reviewReportDTOS) {
//            log.info(reviewReportDTO);
//        }
//        log.info("\n====\n");
//        for (ReviewReportDTO reviewReportDTO : reviewReportDTOS) {
//            String writerEmail = reviewReportDTO.getWriterEmail();
//            int i = writerEmail.indexOf("@");
//            String substring1 = writerEmail.substring(0, i);
//            reviewReportDTO.setWriterEmail("ID : " + substring1);
//            String content = reviewReportDTO.getContent();
//            if (content.length() >= 10) {
//                String substring = content.substring(0, 7);
//                reviewReportDTO.setContent(substring + "....");
//            }
//        }
//        return reviewReportDTOS;
//    }
//
//    // 댓글 신고 리스트 불러오기
//    public List<ReplyReportDTO> replyReportDTOListService(String email) {
//
//        List<ReplyReportDTO> replyReportDTOS = myPageMapper.replyReportDTOList(email);
//        for (ReplyReportDTO replyReportDTO : replyReportDTOS) {
//            String writerEmail = replyReportDTO.getWriterEmail();
//            int i = writerEmail.indexOf("@");
//            String substring = writerEmail.substring(0, i);
//            replyReportDTO.setWriterEmail("ID : " + substring);
//            String replyFaqContent = replyReportDTO.getReplyFaqContent();
//            if (replyFaqContent.length() >= 10) {
//                replyReportDTO.setReplyFaqContent(replyFaqContent.substring(0, 7) + "....");
//            }
//        }
//        return replyReportDTOS;
//    }

    // 신규 !!! !
    public List<ReviewReportDTO2> reviewReportDTOListService2(String email) {

        List<ReviewReportDTO2> reviewReportDTO2s = myPageMapper.reviewReportDTO2List(email);

        for (ReviewReportDTO2 reviewReportDTO2 : reviewReportDTO2s) {
            String reviewTitle = reviewReportDTO2.getReviewTitle();
            String reviewFaqContent = reviewReportDTO2.getReviewFaqContent();
            if (reviewTitle.length() > 15) {
                reviewReportDTO2.setReviewTitle(reviewTitle.substring(0, 10) + "...");

            } else {
                reviewReportDTO2.setReviewTitle(reviewTitle);
            }
            if (reviewFaqContent.length() > 15) {
                reviewReportDTO2.setReviewFaqContent(reviewFaqContent.substring(0, 10) + "...");
            } else {
                reviewReportDTO2.setReviewFaqContent(reviewFaqContent);
            }
            // 그냥 쌩자 !
            reviewReportDTO2.setRealReviewContent(reviewFaqContent);
        }
        return reviewReportDTO2s;
    }

    public List<ReplyReportDTO2> replyReportDTOListService2(String email) {
        List<ReplyReportDTO2> replyReportDTO2s = myPageMapper.replyReportDTO2List(email);
        for (ReplyReportDTO2 replyReportDTO2 : replyReportDTO2s) {
            String replyContent = replyReportDTO2.getReplyContent();
            String replyFaqContent = replyReportDTO2.getReplyFaqContent();
            if (replyContent.length() > 15) {
                replyReportDTO2.setReplyContent(replyContent.substring(0, 10) + "...");
            } else {
                replyReportDTO2.setReplyFaqContent(replyFaqContent);
            }
            if (replyFaqContent.length() > 15) {
                replyReportDTO2.setReplyFaqContent(replyFaqContent.substring(0, 10) + "...");
            } else {
                replyReportDTO2.setReplyFaqContent(replyFaqContent);
            }
            // 그냥 넣기
            replyReportDTO2.setRealReplyFaqContent(replyFaqContent);


        }
        return replyReportDTO2s;
    }

    // 가게 신고 내역
    public List<PromotionReportDTO> promotionReportDTOListService(PromotionInputDTO promotionInputDTO) {
        List<PromotionReportDTO> promotionReportDTOS = myPageMapper.promotionReportList(promotionInputDTO);
        return promotionReportDTOS;
    }


}
