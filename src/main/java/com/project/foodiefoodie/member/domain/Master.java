
package com.project.foodiefoodie.member.domain;

import com.project.foodiefoodie.proBoard.domain.ProBoard;
import com.project.foodiefoodie.proBoard.dto.FileDTO;
import com.project.foodiefoodie.proBoard.dto.StoreTimeDTO;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Master {

    private String businessNo;
    private String masterName;
    private String storeName;
    private String storeAddress;
    private String storeDetailAddress;
    private String storeExtraAddress;
    private String hotDeal;
    private String storeCallNumber;
    private String email;
}