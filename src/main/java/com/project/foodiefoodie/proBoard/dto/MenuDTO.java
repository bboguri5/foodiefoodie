package com.project.foodiefoodie.proBoard.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO {
    private List<String> menuName;
    private List<String> menuPrice;
}
