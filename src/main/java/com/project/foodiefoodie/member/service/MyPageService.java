package com.project.foodiefoodie.member.service;

import com.project.foodiefoodie.member.dto.MyReviewPathDTO;
import com.project.foodiefoodie.member.dto.MyReviewTitleDTO;
import com.project.foodiefoodie.member.dto.ProfileDTO;
import com.project.foodiefoodie.member.repository.MyReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class MyPageService {

    private final MyReviewMapper myReviewMapper;


    // 이건 아이디를 넣으면 아이디에 맞는 리뷰들을 다 가져오는 서비스
    public List<MyReviewTitleDTO> findTitleListService(String email) {
        List<MyReviewTitleDTO> myReviewTitleDTOS = myReviewMapper.reviewTitle(email);
        for (MyReviewTitleDTO titleDTO : myReviewTitleDTOS) {
            String title = titleDTO.getTitle();
            String content = titleDTO.getContent();
            String content2 = content.substring(0, 5);
            String title2 = title.substring(0, 5);
            titleDTO.setTitle(content2 + "...");
            titleDTO.setContent(title2 + "...");
        }
        return myReviewTitleDTOS;
    }

    // 리뷰 번호에따른 첫번째 그림의 경로와 이름만 추출해서 가져감
    public HashMap<Integer, MyReviewPathDTO> findPathListService(String email) {
        // 내가 쓴 리뷰글 번호 , 제목, 내용 을 담은걸 가져옴
        List<MyReviewTitleDTO> myReviewTitleDTOS = myReviewMapper.reviewTitle(email);

        HashMap<Integer, MyReviewPathDTO> reviewPictures = new HashMap<Integer, MyReviewPathDTO>();
        // 계획은 : 리뷰글 번호를 넣으면 , 그 글에 가지고있는 첫번째 사진 경로 ,네임을 넣으려고해서 맵으로 만듦
        //        int size = myReviewTitleDTOS.size();// 내가 쓴 리뷰 갯수
        for (MyReviewTitleDTO titleDTO : myReviewTitleDTOS) {
            int reviewBno = titleDTO.getReviewBno();
            // 리뷰글 번호를 추출해서 리스트에 담고
            List<MyReviewPathDTO> myReviewPathDTOS = myReviewMapper.reviewPath(reviewBno);
            MyReviewPathDTO pathDTO = myReviewPathDTOS.get(0);// 첫번째 사진 의 경로 , 이름을 리턴함
            reviewPictures.put(reviewBno, pathDTO);
        }
        return reviewPictures;
    }

    // 프로필 사진 넣기 서비스
    public boolean insertProfileService(ProfileDTO profileDTO) {
        if (profileCount(profileDTO.getEmail()) == 1) {
            profileDelete(profileDTO.getEmail());
            boolean b = myReviewMapper.insertProfile(profileDTO);
            return b;
        }
        boolean b = myReviewMapper.insertProfile(profileDTO);
        return b;
    }

    // 있는지 없는지 추출하는 메서드 !
    public int profileCount(String email) {
        int i = myReviewMapper.countProfile(email);
        return i;
    }

    // 지우기 !
    public boolean profileDelete(String email) {
        boolean b = myReviewMapper.deleteProfile(email);
        return b;
    }

    // 프로필 사진 불러오기 !
    public ProfileDTO selectProfile(String email) {
        if (profileCount(email) == 1) {
            ProfileDTO profileDTO = myReviewMapper.profilePicture(email);
            return profileDTO;
        }
        return null;
    }


}
