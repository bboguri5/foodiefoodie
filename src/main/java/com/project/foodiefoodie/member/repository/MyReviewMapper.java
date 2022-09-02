package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.dto.MyReviewPathDTO;
import com.project.foodiefoodie.member.dto.MyReviewTitleDTO;
import com.project.foodiefoodie.member.dto.ProfileDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyReviewMapper {


    List<MyReviewTitleDTO> reviewTitle(String email);


    List<MyReviewPathDTO> reviewPath(int reviewBno);

    // 셀렉
    ProfileDTO profilePicture(String email);
    // 삭제
    boolean deleteProfile(String email);
    // 있냐 없냐
    int countProfile(String email);
    // 사진 올리기
    boolean insertProfile(ProfileDTO profileDTO);



}
