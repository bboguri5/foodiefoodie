package com.project.foodiefoodie.myPage.repository;

import com.project.foodiefoodie.myPage.dto.ReplyReportDTO;
import com.project.foodiefoodie.myPage.dto.ReviewReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {

   List<ReviewReportDTO> reviewReportDTOList(String reviewWriterEmail);

    List<ReplyReportDTO> replyReportDTOList(String replyWriterEmail);




}
