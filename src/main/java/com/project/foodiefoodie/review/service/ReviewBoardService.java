package com.project.foodiefoodie.review.service;

import com.project.foodiefoodie.promotion.repository.PromotionBoardMapper;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.domain.ReviewUpload;
import com.project.foodiefoodie.review.dto.ReviewBoardDTO;
import com.project.foodiefoodie.review.dto.ReviewFileDTO;
import com.project.foodiefoodie.review.repository.ReviewBoardMapper;
import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReviewBoardService {

    private final ReviewBoardMapper rbMapper;
    private final PromotionBoardMapper pbMapper;

//    public List<AvgStarDTO> avgStarRateService() {
//        return mapper.avgStarRate();
//    }

    @Transactional
    public boolean saveService(ReviewBoard reviewBoard, List<MultipartFile> reviewImg) {

//        log.info("saveService : reviewBoard - {}", reviewBoard);
//        log.info("saveService : reviewImg - {}", reviewImg);
        // 리뷰 등록
        boolean flag = rbMapper.save(reviewBoard);


        if (flag) {
            // 이미지 등록
            long newReviewNo = rbMapper.findNewReviewNo();
            uploadReviewFile(reviewImg, reviewBoard, newReviewNo);



            // 리뷰, 이미지 저장이 잘 되었으면 가게 평점 & 리뷰 개수 업데이트 해주기
            String businessNo = reviewBoard.getBusinessNo();
//            log.info("save businessNo - {}", businessNo);
            if (!Objects.equals(businessNo, "")) {
//                log.info("!!!!!!!!!!!");
                double avgStarRate = rbMapper.getStarRate(businessNo);
                Long reviewCnt = rbMapper.getReviewCnt(businessNo);

                System.out.println("starRate & reviewCnt = " + avgStarRate + " & " + reviewCnt);
                pbMapper.updateRateAndCount(businessNo, avgStarRate, reviewCnt);
            }

        }

        return flag;
    }

    public List<ReviewBoardDTO> findAllReviewsService(String sort) {
        List<ReviewBoardDTO> allReviews = rbMapper.findAllReviews(sort);
        return allReviews;
    }

    public List<ReviewBoardDTO> searchAllReviewService(String search, String sort) {
//        log.info("search - {}", search);
        return rbMapper.searchAllReview(search, sort);
    }

    public ReviewBoardDTO findOneReviewService(long reviewBno) {
        return rbMapper.findOneReview(reviewBno);
    }

    public List<String> findReviewUploadsForByteService(long reviewBno) {
        List<ReviewUpload> reviewUploads = rbMapper.findReviewUploads(reviewBno);


        List<String> reviewStrImg = new ArrayList<>();

        for (ReviewUpload reviewUpload : reviewUploads) {
//            log.info("filepath - {}", reviewUpload.getFilePath());
            reviewStrImg.add(FoodieFileUtils.getFileContent(reviewUpload.getFilePath()));
//            + '\\' + reviewUpload.getFileName()
        }

        return reviewStrImg;
    }

    public List<ReviewUpload> findReviewUpload(long reviewBno) {
        List<ReviewUpload> reviewUploads = rbMapper.findReviewUploads(reviewBno);

        for (ReviewUpload reviewUpload : reviewUploads) {
            reviewUpload.setFileByteArray(FoodieFileUtils.getImgByte(reviewUpload.getFilePath()));
        }
        return reviewUploads;
    }


    public boolean upLikeService(long reviewBno) {
        return rbMapper.upLike(reviewBno);
    }

    public int getLikeService(long reviewBno) {
        return rbMapper.getLike(reviewBno);
    }


    public boolean uploadReviewFile(List<MultipartFile> reviewImg, ReviewBoard reviewBoard, long reviewBno) {

        String newUploadPath = "";
        String newFileName = "";
        String fileFullPath = "";

//        log.info("uploadReviewFile service - reviewImg : {}", reviewImg);
//        log.info("uploadReviewFile service - reviewBoard : {}", reviewBoard);

        for (int i = 0; i < reviewImg.size(); i++) {
            MultipartFile file = reviewImg.get(i);
            if (file == null) break;

            newUploadPath = getReviewNewUploadPath(reviewBno);
            newFileName = file.getOriginalFilename();
            fileFullPath = newUploadPath + File.separator + newFileName;



            File f = new File(newUploadPath, newFileName); // 파일 객체 생성

            try {
                ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
                reviewFileDTO.setFilePath(fileFullPath);
                reviewFileDTO.setFileName(newFileName);
                reviewFileDTO.setReviewBno(reviewBno);
                reviewFileDTO.setFileSize(file.getSize());

                file.transferTo(f);

//                log.info("fileFullPath - {}", fileFullPath);
                String fileContent = FoodieFileUtils.getFileContent(fileFullPath);
                byte[] filebyte = FoodieFileUtils.getImgByte(fileFullPath);
//                log.info("fileContent - {}", fileContent);
                reviewFileDTO.setFileByte(fileContent);
//                log.info("fileType - {}", file.getContentType());
                String contentType = file.getContentType();

                reviewFileDTO.setFileType(file.getContentType());
//                log.info("type - {}", file.getContentType());

                String fileData = "data:" + file.getContentType() + ";base64," + fileContent;
//                log.info("fileData - {}", fileData);
                reviewFileDTO.setFileData(fileData);

                saveReviewImagePath(reviewFileDTO); // 서버 이미지 경로 DB 저장



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
    public void saveReviewImagePath(ReviewFileDTO reviewFileDTO) {

//        log.info("saveReviewImage service - file : {}  ", reviewFileDTO);

        // review_img img file 저장
        rbMapper.saveReviewFileList(reviewFileDTO);

    }



    public boolean isLikedService(long reviewBno, String email) {
        int liked = rbMapper.isLiked(reviewBno, email);
//        log.info("liked returned int - {}", liked >= 1);
        return liked >= 1;
    }

    public boolean downLikeService(long reviewBno) {
        return rbMapper.downLike(reviewBno);
    }

    public boolean saveReviewLikeService(long reviewBno, String email) {
        return rbMapper.saveReviewLike(reviewBno, email);
    }

    public boolean deleteReviewLikeService(long reviewBno, String email) {
        return rbMapper.deleteReviewLike(reviewBno, email);
    }

    public boolean modifyReview(ReviewBoard reviewBoard, List<MultipartFile> reviewImg) {


        boolean flag = modifyReviewFile(reviewImg, reviewBoard, reviewBoard.getReviewBno());


        if (flag) {

//              리뷰, 이미지 저장이 잘 되었으면 가게 평점 & 리뷰 개수 업데이트 해주기
                String businessNo = reviewBoard.getBusinessNo();
                log.info("save businessNo - {}", businessNo);
                if (!Objects.equals(businessNo, "")) {
                    log.info("!!!!!!!!!!!");
                    double avgStarRate = rbMapper.getStarRate(businessNo);
                    Long reviewCnt = rbMapper.getReviewCnt(businessNo);

                    System.out.println("starRate & reviewCnt = " + avgStarRate + " & " + reviewCnt);
                    pbMapper.updateRateAndCount(businessNo, avgStarRate, reviewCnt);
                }
            }

        return flag;
    }


    // 서버 이미지 삭제
    public void deleteFile(Long reviewBno) {

        String path = "C:\\foodiefoodie\\reviewBoard\\" + reviewBno;
        File folder = new File(path);
        try {
            while(folder.exists()) {
                File[] folder_list = folder.listFiles(); //파일리스트 얻어오기

                for (int j = 0; j < folder_list.length; j++) {
                    folder_list[j].delete(); //파일 삭제
                    System.out.println("파일이 삭제되었습니다.");

                }

                if(folder_list.length == 0 && folder.isDirectory()){
                    folder.delete(); //대상폴더 삭제
                    System.out.println("폴더가 삭제되었습니다.");
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

    }

    public boolean modifyReviewFile(List<MultipartFile> reviewImg, ReviewBoard reviewBoard, long reviewBno) {

        /*
            reviewImg : post 요청으로 넘어온 이미지 리스트
            reviewImg 리스트로 넘어온 파일 이름과 해당 리뷰글 서버경로에 저장되어 있는 파일 이름을 비교해서
            같다면 처리 x / 서버에는 있지만 reviewImg 리스트에는 없다면 삭제 / reviewImg 리스트에는 있지만 서버에는 없다면 추가
         */


        String originReviewImgPath = "C:\\foodiefoodie\\reviewBoard\\" + reviewBno;
        File folder = new File(originReviewImgPath);
        try {
            if (folder.exists()) { // 해당 폴더가 존재 유무 확인
                File[] folder_list = folder.listFiles(); //파일리스트 얻어오기

                String newUploadPath = "";
                String newFileName = "";
                String fileFullPath = "";

                // 리스트에 이미지 이름만 저장
                List<String> imgNameList = new ArrayList<>();
                for (MultipartFile file : reviewImg) {
                    imgNameList.add(file.getOriginalFilename());
                }
//                log.info("imgName - {}", imgName);

                List<String> fileNameList = new ArrayList<>();
                for (File file : folder_list) {
                    fileNameList.add(file.getName());
                }

                // 수정시 삭제 되어야 하는것
                for (File file : folder_list) {
                    String fileName = file.getName();
                    if (!imgNameList.contains(fileName)) {
                        file.delete();
                        rbMapper.deleteReviewFileList(reviewBno, fileName);
                    }

                }

                // 수정시 등록되어야 하는것
                for (MultipartFile files : reviewImg) {
                    String originalFilename = files.getOriginalFilename();
                    if (!fileNameList.contains(originalFilename)) {
                        newUploadPath = getReviewNewUploadPath(reviewBno);
                        newFileName = files.getOriginalFilename();
                        fileFullPath = newUploadPath + File.separator + newFileName;

                        File f = new File(newUploadPath, newFileName); // 파일 객체 생성

                        try {
                            ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
                            reviewFileDTO.setFilePath(fileFullPath);
                            reviewFileDTO.setFileName(newFileName);
                            reviewFileDTO.setReviewBno(reviewBno);
                            reviewFileDTO.setFileSize(files.getSize());

                            files.transferTo(f);

                            String fileContent = FoodieFileUtils.getFileContent(fileFullPath);
                            byte[] filebyte = FoodieFileUtils.getImgByte(fileFullPath);
                            reviewFileDTO.setFileByte(fileContent);
                            String contentType = files.getContentType();

                            reviewFileDTO.setFileType(files.getContentType());

                            String fileData = "data:" + files.getContentType() + ";base64," + fileContent;
                            reviewFileDTO.setFileData(fileData);

                            saveReviewImagePath(reviewFileDTO); // 서버 이미지 경로 DB 저장

                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }



    public List<Long> getLikedListService(String email) {
//        log.info("liked list - {}", rbMapper.getLikedList(email));
        return rbMapper.getLikedList(email);
    }
}
