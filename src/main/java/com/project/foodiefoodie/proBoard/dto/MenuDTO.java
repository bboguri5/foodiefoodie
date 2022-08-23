package com.project.foodiefoodie.proBoard.dto;

import com.project.foodiefoodie.proBoard.domain.ProBoard;
import lombok.*;

import java.util.HashMap;
import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO{

   private String menuName;
   private int menuPrice;
   private String filePath;
   private String fileName;


}
