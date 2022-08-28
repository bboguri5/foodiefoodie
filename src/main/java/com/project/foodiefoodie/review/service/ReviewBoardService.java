package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.proBoard.dto.ImageDTO;
import com.project.foodiefoodie.proBoard.dto.MenuDTO;
import com.project.foodiefoodie.promotion.repository.PromotionBoardMapper;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.repository.ReviewBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReviewBoardService {

    private final ReviewBoardMapper rbMapper;
    private final PromotionBoardMapper pbMapper;

//    public List<AvgStarDTO> avgStarRateService() {
//        return mapper.avgStarRate();
//    }

    @Transactional
    public boolean saveService(ReviewBoard reviewBoard, List<MultipartFile> reviewImg) {

        log.info("saveService : reviewBoard - {}", reviewBoard);
        log.info("saveService : reviewImg - {}", reviewImg);
        log.info("어디까지 들어와~~11111");
        // 리뷰 등록
        boolean flag = rbMapper.save(reviewBoard);

        log.info("어디까지 들어와~~22222");

        if (flag) {
            log.info("어디까지 들어와~~33333");
            // 이미지 등록
            long newReviewNo = rbMapper.findNewReviewNo();
            log.info(newReviewNo);
            uploadReviewFile(reviewImg, reviewBoard, newReviewNo);

            log.info("어디까지 들어와~~44444");
            // 리뷰, 이미지 저장이 잘 되었으면 가게 평점 & 리뷰 개수 업데이트 해주기
            String businessNo = reviewBoard.getBusinessNo();

            log.info("어디까지 들어와~~55555");
            double avgStarRate = rbMapper.getStarRate(businessNo);
            Long reviewCnt = rbMapper.getReviewCnt(businessNo);

            log.info("어디까지 들어와~~66666");
            System.out.println("starRate & reviewCnt = " + avgStarRate + " & " + reviewCnt);
            pbMapper.updateRateAndCount(businessNo, avgStarRate, reviewCnt);
        }

        return flag;
    }

    public List<ReviewBoardDTO> findAllReviewsService() {
        List<ReviewBoardDTO> allReviews = rbMapper.findAllReviews();
        return allReviews;
    }

    public ReviewBoardDTO findOneReviewService(long reviewBno) {
        return rbMapper.findOneReview(reviewBno);
    }

    public List<ReviewUpload> findReviewUploadsService(long reviewBno) {
        return rbMapper.findReviewUploads(reviewBno);
    }

    public boolean upLikeService(long reviewBno) {
        return rbMapper.upLike(reviewBno);
    }

    public int getLikeService(long reviewBno) {
        return rbMapper.getLike(reviewBno);
    }


    public boolean uploadReviewFile(List<MultipartFile> reviewImg, ReviewBoard reviewBoard, long reviewBno) {

        log.info("여기는 오니??!11111");
        String newUploadPath = "";
        String newFileName = "";
        String fileFullPath = "";

        log.info("uploadReviewFile service - reviewImg : {}", reviewImg);
        log.info("uploadReviewFile service - reviewBoard : {}", reviewBoard);

        log.info("여기는 오니??!22222");
        for (int i = 0; i < reviewImg.size(); i++) {
            MultipartFile file = reviewImg.get(i);
            if (file == null) break;

            log.info("여기는 오니??!33333");
            newUploadPath = getReviewNewUploadPath(reviewBno);
            newFileName = String.format("%s_%s", "review" + i + 1, file.getOriginalFilename());
            fileFullPath = newUploadPath + File.separator + newFileName;


            log.info("여기는 오니??!44444");
            File f = new File(newUploadPath, newFileName); // 파일 객체 생성

            try {
                saveReviewImagePath(reviewBno, fileFullPath, newFileName); // 서버 이미지 경로 DB 저장

                log.info("여기는 오니??!55555");
                file.transferTo(f);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return true;
    }


    private String getReviewNewUploadPath(long reviewBno) {

        String newUploadPath = "C:\\foodiefoodie\\reviewBoard";
        newUploadPath += File.separator + reviewBno;

        File dirName = new File(newUploadPath);
        if (!dirName.exists()) dirName.mkdirs();

        return newUploadPath;
    }

    // 서버 경로 이미지 저장 함수
    public void saveReviewImagePath(long reviewBno, String fileFullPath, String newFileName) {

        log.info("saveReviewImage service - file : {}  ", fileFullPath);

        // review_img img file 저장
        rbMapper.reviewUpload(reviewBno, fileFullPath, newFileName);

    }


}
