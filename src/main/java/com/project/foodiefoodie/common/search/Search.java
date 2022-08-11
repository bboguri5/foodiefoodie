package com.project.foodiefoodie.common.search;

import com.project.foodiefoodie.common.paging.Page;
import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Search extends Page {

    private String keyword;

}
