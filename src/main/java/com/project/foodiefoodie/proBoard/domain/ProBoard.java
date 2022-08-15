package com.project.foodiefoodie.proBoard.domain;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProBoard {

    private String businessNo;
    private int promotionBno;
    private Date lastUpdated;
    private String content;
    private String title;
    private String hashTag;


    // 동진 : 메뉴가 여러개 들어올걸 대비해서 리스트 타입으로 받아야 스프링에서 알아서 넣어줄거 같아요!
//    private List<String> menu; // menu라는 변수명은 input name 속성값과 맞춘 것!   menuList라고 하시려면 @RequestParm("menu") 활용!

//    ======================================================= //
    // 얘네를 DTO로 따로 빼서 홍보글 작성 요청(post)이 들어올 때 커맨드 객체를 2개 사용하는게 좀 더 편할거 같아요!
    // 이유는 각각 넣어줘야 하는 DB 테이블이 달라서..
    // 그래서 ImageDTO 클래스 만들었습니다~~

//    private MultipartFile titleImg;
//    private List<MultipartFile> detailImg;
//    private List<MultipartFile> menuImg;
}
