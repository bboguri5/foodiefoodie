package com.project.foodiefoodie.member.dto.find;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class EmailCodeDTO {

    private String email;
    private String authCode;
    private String realAuthCode;

}
