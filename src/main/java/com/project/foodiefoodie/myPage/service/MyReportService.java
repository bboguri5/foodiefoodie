package com.project.foodiefoodie.myPage.service;

import com.project.foodiefoodie.myPage.dto.ReplyReportDTO;
import com.project.foodiefoodie.myPage.dto.ReviewReportDTO;
import com.project.foodiefoodie.myPage.repository.MyPageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MyReportService {

    private final MyPageMapper myPageMapper;

    // 리뷰 신고 리스트 불러오기
    public List<ReviewReportDTO> reviewReportDTOListService(String email) {
        List<ReviewReportDTO> reviewReportDTOS = myPageMapper.reviewReportDTOList(email);
        for (ReviewReportDTO reviewReportDTO : reviewReportDTOS) {
            String writerEmail = reviewReportDTO.getWriterEmail();
            int i = writerEmail.indexOf("@");
            String substring1 = writerEmail.substring(0, i);
            reviewReportDTO.setWriterEmail("ID : " + substring1);
            String content = reviewReportDTO.getContent();
            if (content.length() >= 10) {
                String substring = content.substring(0, 7);
                reviewReportDTO.setContent(substring + "....");
            }
        }
        return reviewReportDTOS;
    }

    // 댓글 신고 리스트 불러오기
    public List<ReplyReportDTO> replyReportDTOListService(String email) {

        List<ReplyReportDTO> replyReportDTOS = myPageMapper.replyReportDTOList(email);
        for (ReplyReportDTO replyReportDTO : replyReportDTOS) {
            String writerEmail = replyReportDTO.getWriterEmail();
            int i = writerEmail.indexOf("@");
            String substring = writerEmail.substring(0, i);
            replyReportDTO.setWriterEmail("ID : " + substring);
            String replyFaqContent = replyReportDTO.getReplyFaqContent();
            if (replyFaqContent.length()>=10){
                replyReportDTO.setReplyFaqContent(replyFaqContent.substring(0,7)+"....");
            }
        }
        return replyReportDTOS;
    }


}
