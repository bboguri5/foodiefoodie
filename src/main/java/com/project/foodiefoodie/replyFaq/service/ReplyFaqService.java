package com.project.foodiefoodie.replyFaq.service;

import com.project.foodiefoodie.replyFaq.domain.ReplyFaq;
import com.project.foodiefoodie.replyFaq.dto.ReplyFaqDTO;
import com.project.foodiefoodie.replyFaq.repository.ReplyFaqMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReplyFaqService {

    private final ReplyFaqMapper mapper;

    public List<ReplyFaq> findAllService(String complete) {
        List<ReplyFaq> replyFaqList = mapper.findAll(complete);
        return replyFaqList;
    }

    public ReplyFaq findOneService(long replyFaqNo) {
        ReplyFaq replyFaq = mapper.findOne(replyFaqNo);
        return replyFaq;
    }

    public boolean updateService(long replyFaqNo, String complete) {
        return mapper.update(replyFaqNo, complete);
    }

    public List<ReplyFaqDTO> findAllReplyService(String complete) {
        List<ReplyFaqDTO> replyFaqDTOList = mapper.findAllReply(complete);
        log.info("findAllReplyService replyFaqDTOList - {}", replyFaqDTOList);
        for (ReplyFaqDTO r : replyFaqDTOList) {
            String replyContent = r.getReplyContent();
            if (replyContent.length() > 5) {
                String substring = replyContent.substring(0, 5);
                r.setShortContent(substring + "...");
            } else {
                r.setShortContent(replyContent);
            }

        }
        return replyFaqDTOList;
    }

    public boolean saveService(ReplyFaq replyFaq) {

        boolean flag = mapper.save(replyFaq);




        return flag;
    }

}
