package com.project.foodiefoodie.member.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class MasterModifyDTO {

    private String businessNo;
    private String storeName;
    private String storeCallNumber;
    private String storeAddress;
    private String storeDetailAddress;
    private String storeExtraAddress;
}
