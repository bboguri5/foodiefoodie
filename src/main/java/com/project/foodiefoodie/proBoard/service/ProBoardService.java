package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.*;
import com.project.foodiefoodie.proBoard.repository.ProBoardMapper;
import com.project.foodiefoodie.review.domain.ReviewBoard;
import com.project.foodiefoodie.review.dto.ReviewFileDTO;
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
public class ProBoardService {
    private final ProBoardMapper proBoardMapper;


    @Transactional
    public boolean modifyProBoard(ProBoard proBoard, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {
        log.info( " service modifyProBoard {} ",proBoard.getPromotionBno());
        int promotionBno = proBoard.getPromotionBno();

        proBoardMapper.modifyProBoard(proBoard);
        proBoardMapper.modifyStoreTime(proBoard);
        return modifyMenu(promotionBno,menuList);

//        for(String key : fileMap.keySet())
//        {
//            System.out.println(key);
//        }
    }

//    public boolean delete(int promotionBno) {
//        return proBoardMapper.delete(promotionBno);
//    }

    @Transactional
    public boolean saveProBoard(ProBoard proBoard, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {

        log.info(" saveProBoard service init - {}", proBoard);
        boolean result = proBoardMapper.saveProBoard(proBoard); // content , title .. 저장

        if (result) {

            log.info(" saveProBoard result init - {} ", result);
            int promotionBno = proBoardMapper.selectPromotionBno(proBoard.getBusinessNo());
            proBoard.setPromotionBno(promotionBno);

            proBoardMapper.saveStoreTime(proBoard);
            saveMenu(promotionBno, menuList);

            for (String key : fileMap.keySet()) {
                saveImgInfo(uploadImgFile(proBoard, fileMap.get(key), key));
            }
        }

        return result;
    }

    public ProBoard selectProBoard(int promotionBno) {
        return proBoardMapper.selectProBoard(promotionBno);
    }

    public Master selectMaster(String businessNo) {
        return proBoardMapper.selectMaster(businessNo);
    }

    /* ===================================== files ===================================== */

    // upload path 생성 함수
    // ex) C:\foodiefoodie\proBoard\1234-12-12345\detail
    private String getNewUploadPath(String newFolder, String businessNo) {

        String newUploadPath = "C:\\foodiefoodie\\proBoard";
        newUploadPath += File.separator + businessNo;
        newUploadPath += File.separator + newFolder;

        File dirName = new File(newUploadPath);
        if (!dirName.exists()) dirName.mkdirs();

        log.info(" service getNewUploadPath {} ", newUploadPath);
        return newUploadPath;
    }

    private List<FileDTO> uploadImgFile(ProBoard proBoard, List<MultipartFile> fileList, String folderName) {

        log.info(" service uploadImgFile {}", proBoard.getPromotionBno());

        List<FileDTO> fileDTOList = new ArrayList<>();
        for (MultipartFile imgFile : fileList) {

            if (imgFile.getSize() == 0) return null;

            if (imgFile.getOriginalFilename().equals("default")) {
                FileDTO fileDTO = new FileDTO();
                fileDTO.setFilePath("\\img");
                fileDTO.setFileName("foodie_default.PNG");
                fileDTOList.add(fileDTO);
                continue;
            }

            try {
                String newPath = getNewUploadPath(folderName, proBoard.getBusinessNo());
                File file = new File(newPath, Objects.requireNonNull(imgFile.getOriginalFilename()));

                if(file.exists())
                    continue;
                imgFile.transferTo(file);
                fileDTOList.add(new FileDTO(proBoard.getPromotionBno(), file));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return fileDTOList;
    }

    private boolean saveImgInfo(List<FileDTO> fileDTOList) {

        if (fileDTOList == null) return false;

        List<Boolean> resultList = new ArrayList<>();
        for (FileDTO fileDTO : fileDTOList) {
            resultList.add(proBoardMapper.saveFiles(fileDTO));
        }
        return !resultList.contains(false);
    }

    public List<FileDTO> selectFiles(int promotionBno , String type) {return proBoardMapper.selectFiles(promotionBno,type);}

    /* ===================================== notice ===================================== */

    public List<NoticeDTO> selectNotice(int promotionBno) {
        return proBoardMapper.selectNotice(promotionBno);
    }

    public boolean saveNotice(NoticeDTO noticeDTO) {return proBoardMapper.saveNotice(noticeDTO);}

    public boolean deleteNotice(int noticeNo) {
        return proBoardMapper.deleteNotice(noticeNo);
    }

    /* ===================================== menu ===================================== */
    public List<MenuDTO> selectMenuInfo(int promotionBno) {
        return proBoardMapper.selectMenuInfo(promotionBno);
    }

    private boolean saveMenu(int promotionBno, List<String[]> menuList) {
        List<Boolean> resultList = new ArrayList<>();
        for (int i = 0; i < menuList.get(0).length; i++) {
            if (menuList.get(0)[i].isEmpty() && menuList.get(1)[i].isEmpty()) return false;
            resultList.add(proBoardMapper.saveMenu(
                    promotionBno, menuList.get(0)[i]
                    , Integer.parseInt(menuList.get(1)[i]))
            );
        }
        return !resultList.contains(false);
    }

    private boolean modifyMenu(int promotionBno, List<String[]> menuList) {
        List<Boolean> resultList = new ArrayList<>();
        for (int i = 0; i < menuList.get(0).length; i++) {
            if (menuList.get(0)[i].isEmpty() && menuList.get(1)[i].isEmpty()) return false;
            resultList.add(proBoardMapper.modifyMenu(
                    promotionBno, menuList.get(0)[i]
                    , Integer.parseInt(menuList.get(1)[i]))
            );
        }
        return !resultList.contains(false);
    }

//    public boolean modifyReviewFile(List<MultipartFile> reviewImg, ReviewBoard reviewBoard, long reviewBno) {
//
//        /*
//            reviewImg : post 요청으로 넘어온 이미지 리스트
//            reviewImg 리스트로 넘어온 파일 이름과 해당 리뷰글 서버경로에 저장되어 있는 파일 이름을 비교해서
//            같다면 처리 x / 서버에는 있지만 reviewImg 리스트에는 없다면 삭제 / reviewImg 리스트에는 있지만 서버에는 없다면 추가
//         */
//
//
//        String originReviewImgPath = "C:\\foodiefoodie\\reviewBoard\\" + reviewBno;
//        File folder = new File(originReviewImgPath);
//        try {
//            if (folder.exists()) { // 해당 폴더가 존재 유무 확인
//                File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
//
//                String newUploadPath = "";
//                String newFileName = "";
//                String fileFullPath = "";
//
//                // 리스트에 이미지 이름만 저장
//                List<String> imgNameList = new ArrayList<>();
//                for (MultipartFile file : reviewImg) {
//                    imgNameList.add(file.getOriginalFilename());
//                }
////                log.info("imgName - {}", imgName);
//
//                List<String> fileNameList = new ArrayList<>();
//                for (File file : folder_list) {
//                    fileNameList.add(file.getName());
//                }
//
//                // 수정시 삭제 되어야 하는것
//                for (File file : folder_list) {
//                    String fileName = file.getName();
//                    if (!imgNameList.contains(fileName)) {
//                        file.delete();
//                        rbMapper.deleteReviewFileList(reviewBno, fileName);
//                    }
//
//                }
//
//                // 수정시 등록되어야 하는것
//                for (MultipartFile files : reviewImg) {
//                    String originalFilename = files.getOriginalFilename();
//                    if (!fileNameList.contains(originalFilename)) {
//                        newUploadPath = getReviewNewUploadPath(reviewBno);
//                        newFileName = files.getOriginalFilename();
//                        fileFullPath = newUploadPath + File.separator + newFileName;
//
//                        File f = new File(newUploadPath, newFileName); // 파일 객체 생성
//
//                        try {
//                            ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
//                            reviewFileDTO.setFilePath(fileFullPath);
//                            reviewFileDTO.setFileName(newFileName);
//                            reviewFileDTO.setReviewBno(reviewBno);
//                            reviewFileDTO.setFileSize(files.getSize());
//
//                            files.transferTo(f);
//
//                            String fileContent = FoodieFileUtils.getFileContent(fileFullPath);
//                            byte[] filebyte = FoodieFileUtils.getImgByte(fileFullPath);
//                            reviewFileDTO.setFileByte(fileContent);
//                            String contentType = files.getContentType();
//
//                            reviewFileDTO.setFileType(files.getContentType());
//
//                            String fileData = "data:" + files.getContentType() + ";base64," + fileContent;
//                            reviewFileDTO.setFileData(fileData);
//
//                            saveReviewImagePath(reviewFileDTO); // 서버 이미지 경로 DB 저장
//
//                        } catch (IOException e) {
//                            e.printStackTrace();
//                        }
//                    }
//                }
//                return true;
//            }
//            return false;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }




    public Integer isHotDealService(String businessNo) {
        log.info("isHotDeal - {}", proBoardMapper.isHotDeal(businessNo));
        return proBoardMapper.isHotDeal(businessNo);
    }
}
