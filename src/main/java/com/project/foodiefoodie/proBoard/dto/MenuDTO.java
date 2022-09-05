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
public class MenuDTO extends FileDTO{

   private int promotionBno;
   private int menuNo;
   private String menuName;
   private int menuPrice;
}
