package com.project.foodiefoodie.member.repository;

import com.project.foodiefoodie.member.dto.MyReviewPathDTO;
import com.project.foodiefoodie.member.dto.MyReviewTitleDTO;
import com.project.foodiefoodie.member.dto.ProfileDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MyReviewMapperTest {

    @Autowired
    MyReviewMapper myReviewMapper;

    @Test
    @DisplayName("검색한 이메일에 따라서 검색결과가 나와야 한다")
    void readTitle(){ // 성공
        String email = "soslimso@nate.com";
        List<MyReviewTitleDTO> myReviewTitleDTOS = myReviewMapper.reviewTitle(email);
        for (MyReviewTitleDTO title : myReviewTitleDTOS) {
            System.out.println(title);
        }
    }

    @Test
    @DisplayName("검색한 리뷰번호의 경로를 뱉어낸다")
    void readPath(){ // 성공
        int reviewBno = 1;
        List<MyReviewPathDTO> myReviewPathDTOS = myReviewMapper.reviewPath(reviewBno);
        for (MyReviewPathDTO pathDTO : myReviewPathDTOS) {
//            System.out.println(pathDTO);
            String filePath = pathDTO.getFilePath();
            String fileName = pathDTO.getFileName();
            System.out.println(fileName + filePath);
        }
    }

    @Test
    @DisplayName("이메일을 넣으면 그에 맞는 파일이름 경로 뱉어냄 ")
    void profileSelect(){// 성공
        String email = "soslimso@nate.com";
        ProfileDTO profileDTO = myReviewMapper.profilePicture(email);
        System.out.println("\n\n\n=================================\n\n\n");
        System.out.println(profileDTO);
        System.out.println("\n\n\n=================================\n\n\n");
    }

    @Test
    @DisplayName("이메일 넣으면 프로필 사진 몇개인지 뜸")
    void countProfile(){
        String email = "soslimso@nate.com";
        int i = myReviewMapper.countProfile(email);
        System.out.println("\n\n\n=================================\n\n\n");
        System.out.println(i);
        assertEquals(1,i);
        System.out.println("\n\n\n=================================\n\n\n");
    }

    @Test
    @DisplayName("이메일 넣으면 ProfileDTO 가 삭제되야 함")
    void deleteProfile(){ // 성공
        String email = "soslimso@nate.com";
        System.out.println("\n\n\n=================================\n\n\n");
        boolean b = myReviewMapper.deleteProfile(email);
        System.out.println(b);
        assertTrue(b);
        System.out.println("\n\n\n=================================\n\n\n");
        int i = myReviewMapper.countProfile(email);
        System.out.println(i);
        assertEquals(0,i);
        System.out.println("\n\n\n=================================\n\n\n");

    }

    @Test
    @DisplayName("들어간다 ")
    void insertProfile(){
        ProfileDTO profileDTO = new ProfileDTO();
        profileDTO.setEmail("soslimso@nate.com");
        profileDTO.setFilePath("soslimsoProfilePath");
        profileDTO.setFileName("facebook");
        boolean b = myReviewMapper.insertProfile(profileDTO);
        System.out.println("\n\n\n=================================\n\n\n");
        assertTrue(b);
        System.out.println("\n\n\n=================================\n\n\n");
    }



}