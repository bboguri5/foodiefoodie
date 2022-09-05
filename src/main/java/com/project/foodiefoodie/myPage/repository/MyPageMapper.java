package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {

   List<ReviewReportDTO> reviewReportDTOList(String reviewWriterEmail);

    List<ReplyReportDTO> replyReportDTOList(String replyWriterEmail);

    List<ReviewReportDTO2> reviewReportDTO2List(String reviewWriterEmail);

    List<ReplyReportDTO2> replyReportDTO2List(String replyWriterEmail);


    List<PromotionReportDTO> promotionReportList(PromotionInputDTO promotionInputDTO);
}
