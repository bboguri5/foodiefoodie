package com.project.foodiefoodie.proBoard.service;


import com.project.foodiefoodie.member.domain.Master;
import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.*;
import com.project.foodiefoodie.proBoard.repository.ProBoardFileMapper;
import com.project.foodiefoodie.proBoard.repository.ProBoardMapper;
import com.project.foodiefoodie.util.FoodieFileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.relational.core.sql.Not;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ProBoardService {
    private final ProBoardMapper proBoardMapper;
    private final ProBoardFileMapper proBoardFileMapper;


    @Transactional
    public boolean saveProBoard(ProBoard proBoard, StoreTimeDTO storeTime, List<String[]> menuList, Map<String, List<MultipartFile>> fileMap) {

        log.info(" saveProBoard service init - {}", proBoard);
        boolean result = proBoardMapper.saveProBoard(proBoard); // content , title .. 저장

        if (result) {

            log.info(" saveProBoard result init - {} ", result);
            int promotionBno = proBoardMapper.selectPromotionBno(proBoard.getBusinessNo());
//            proBoardMapper.saveProBoardStoreTime(promotionBno, storeTime); // storeTime 저장
            System.out.println("엉망 진창 ");
            saveTitleImgInfo(uploadTitleImgFile(promotionBno, proBoard.getBusinessNo(), fileMap.get("title").get(0)));
            saveDetailImgInfo(uploadDetailImgFile(promotionBno, proBoard.getBusinessNo(), fileMap.get("detail")));
            saveMenuImgInfo(uploadMenuImgFile(promotionBno, proBoard.getBusinessNo(), fileMap.get("menu")));
            saveMenu(promotionBno, menuList);
        }

        return result;
    }

    public boolean saveNotice(NoticeDTO noticeDTO) {


        return proBoardMapper.saveNotice(noticeDTO);
    }

    public boolean modify(ProBoard proBoard) {
        return proBoardMapper.modify(proBoard);
    }

    public boolean delete(int promotionBno) {
        return proBoardMapper.delete(promotionBno);
    }

    public boolean deleteNotice(int noticeNo) {
        return proBoardMapper.deleteNotice(noticeNo);
    }

    public ProBoard selectOne(int promotionBno) {
        return proBoardMapper.selectOne(promotionBno);
    }

    public Master selectMaster(String businessNo) {
        return proBoardMapper.selectMaster(businessNo);
    }

    public StoreTimeDTO selectStoreTime(int promotionBno) {
        return proBoardMapper.selectStoreTime(promotionBno);
    }


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

    private FileDTO uploadTitleImgFile(int promotionBno, String businessNo, MultipartFile titleFile) {
        log.info(" service uploadTitleImgFile {}", titleFile.getOriginalFilename());
        if (titleFile.getOriginalFilename().isEmpty()) return null;

        String newPath = getNewUploadPath("title", businessNo);
        File file = new File(newPath, Objects.requireNonNull(titleFile.getOriginalFilename()));
        try {
            titleFile.transferTo(file);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return new FileDTO(promotionBno, titleFile, newPath);
    }

    private boolean saveTitleImgInfo(FileDTO fileDTO) {
        if (fileDTO == null) return false;

        return proBoardFileMapper.saveFileTitle(fileDTO);
    }

    private List<FileDTO> uploadDetailImgFile(int promotionBno, String businessNo, List<MultipartFile> detailFileList) {
        log.info(" service uploadDetailImgFile {}", detailFileList);
        log.info(" service uploadDetailImgFile  size {}", detailFileList.size());

        List<FileDTO> fileDTOList = new ArrayList<>();
        for (MultipartFile detailFile : detailFileList) {
            log.info("detail name : {}" , detailFile.getSize());
            if (detailFile.getSize() == 0){
                log.info("{}",detailFile.getSize()==0);
                return null;
            }

            String newPath = getNewUploadPath("detail", businessNo);
            File file = new File(newPath, Objects.requireNonNull(detailFile.getOriginalFilename()));
            fileDTOList.add(new FileDTO(promotionBno, detailFile, newPath));

            try {
                detailFile.transferTo(file);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return fileDTOList;
    }

    private boolean saveDetailImgInfo(List<FileDTO> fileDTOList) {
        if (fileDTOList == null) return false;

        List<Boolean> resultList = new ArrayList<>();
        for (FileDTO fileDTO : fileDTOList) {
            resultList.add(proBoardFileMapper.saveFileDetail(fileDTO));
        }

        return !resultList.contains(false);
    }

    private List<FileDTO> uploadMenuImgFile(int promotionBno, String businessNo, List<MultipartFile> menuFileList) {
        log.info(" service uploadMenuImgFile {}", menuFileList);
        log.info(" service uploadMenuImgFile  size {}", menuFileList.size());

        List<FileDTO> fileDTOList = new ArrayList<>();
        for (MultipartFile menuFile : menuFileList) {
            System.out.println(menuFile.getOriginalFilename());
            if (menuFile.getOriginalFilename().isEmpty()) return null;

            if (menuFile.getOriginalFilename().equals("default")) {
                FileDTO fileDTO = new FileDTO();
                fileDTO.setFilePath("\\img");
                fileDTO.setFileName("foodie_default.PNG");
                fileDTOList.add(fileDTO);
                continue;
            }

            String newPath = getNewUploadPath("menu", businessNo);
            File file = new File(newPath, Objects.requireNonNull(menuFile.getOriginalFilename()));
            fileDTOList.add(new FileDTO(promotionBno, menuFile, newPath));

            try {
                menuFile.transferTo(file);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return fileDTOList;
    }

    private boolean saveMenuImgInfo(List<FileDTO> fileDTOList) {

        log.info(fileDTOList.size());
        List<Boolean> resultList = new ArrayList<>();
        for (FileDTO fileDTO : fileDTOList) {
            if (fileDTO == null) return false;
            resultList.add(proBoardFileMapper.saveFileMenu(fileDTO));
        }
        return !resultList.contains(false);
    }

    private boolean saveMenu(int promotionBno, List<String[]> menuList) {
        List<Boolean> resultList = new ArrayList<>();
        for (int i = 0; i < menuList.get(0).length; i++) {
            resultList.add(proBoardMapper.saveProBoardMenu(
                    promotionBno, menuList.get(0)[i]
                    , Integer.parseInt(menuList.get(1)[i]))
            );
        }
        return !resultList.contains(false);
    }


//    // 서버 내 파일 저장 함수
//    public boolean uploadMasterFile(int promotionBno, List<String[]> menuList,  Map<String, List<MultipartFile>> fileMap) {
//
//        log.info(" uploadMasterFile service - init {}", promotionBno);
//        String[] args = {"title", "detail", "menu"};
//        String newUploadPath = "";
//        String newFileName = "";
////        String fileFullPath ="";
////        String responseFilePath ="";
//
//        for (int i = 0; i < fileMap.size(); i++) { // key = title , detail , menu
//            List<MultipartFile> files = fileMap.get(args[i]);
//            for (int j = 0; j < files.size(); j++) { // value list
//                MultipartFile file = files.get(j);
//                if (file == null) break;
//
//                log.info(" uploadMasterFile service file - key : {} value : {} ", args[i], file.getOriginalFilename());
//
//                if (file.getOriginalFilename().equals("default")) // default = 이미지가 없는 메뉴
//                {
//                    newUploadPath = "\\img";
//                    newFileName = "foodie_default.PNG"; // 기본 이미지
////                    fileFullPath = newUploadPath + File.separator + newFileName;
//                } else // 이미지가 있는 파일들
//                {
//                    newUploadPath = getMasterNewUploadPath(proBoard.getBusinessNo(), args[i]);
//                    newFileName = String.format("%s_%s", args[i] + (j + 1), file.getOriginalFilename());
////                    fileFullPath = newUploadPath + File.separator + newFileName;
//                }
//
//                File f = new File(newUploadPath, newFileName); // 파일 객체 생성
//
//                try {
//                    saveProBoardImagePath(promotionBno, newUploadPath, newFileName, menuList, j, args[i]); // 서버 이미지 경로 DB 저장
//
//                    if (file.getOriginalFilename().equals("default")) continue; // default 는 이미지 저장 X
//
//                    file.transferTo(f);
//
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//
//        return true;
//    }
//
//    // 서버 경로 이미지 저장 함수
//    public void saveProBoardImagePath(int promotionBno, String newUploadPath, String newFileName, List<String[]> menuList, int index, String type) {
//
//        log.info("saveProBoardImage service - file : {}  ", newUploadPath);
//
//        if (type.equals("menu")) {
//            log.info("save ProBoardImage service -  menu_no ASC {} ", index);
//
//            // 메뉴 리스트 저장 (img파일포함) - menuList.get(0) = menuNames , menuList.get(1) = menuPrices
//            proBoardMapper.saveProBoardMenu(promotionBno, new MenuDTO(0, menuList.get(0)[index], Integer.parseInt(menuList.get(1)[index]), newUploadPath, newFileName));
//            return;
//        }
//        if (type.equals("title")) {
//            // proBoard title img 파일 경로 저장
//            proBoardMapper.saveProBoardTitleImg(promotionBno, newUploadPath, newFileName);
//        }
//
//        // title , detail img file 저장
//        proBoardMapper.saveProBoardImage(promotionBno, new ImageDTO(newFileName, newUploadPath, type));
//    }


    public List<NoticeDTO> selectNotice(int promotionBno) {
        return proBoardMapper.selectNotice(promotionBno);
    }


    public List<MenuDTO> selectMenuInfo(int promotionBno) {
        List<MenuDTO> menuDTOS = proBoardMapper.selectMenuInfo(promotionBno);
        for (MenuDTO menuDTO : menuDTOS) {
            if (menuDTO.getFileName().equals("foodie_default.PNG")) {
                menuDTO.setFilePath(menuDTO.getFilePath() + "\\" + menuDTO.getFileName());
            } else {
                menuDTO.setFilePath(FoodieFileUtils.getFileContent(menuDTO.getFilePath() + "//" + menuDTO.getFileName()));
            }
        }
        return menuDTOS;
    }

    public String selectTitleImg(int promotionBno) {
        ImageDTO titleImg = (proBoardMapper.selectImages(promotionBno, "title")).get(0);
        log.info("titleImg - {}", titleImg);
        return FoodieFileUtils.getFileContent(titleImg.getFilePath() + '\\' + titleImg.getFileName());
    }

    public List<String> selectDetailImgList(int promotionBno) {
        List<ImageDTO> detailImgList = proBoardMapper.selectImages(promotionBno, "detail");

        List<String> detailImgStrList = new ArrayList<>();

        for (ImageDTO detailImg : detailImgList) {
            detailImgStrList.add(FoodieFileUtils.getFileContent(detailImg.getFilePath() + '\\' + detailImg.getFileName()));
        }

        return detailImgStrList;
    }

}
