package com.project.foodiefoodie.member.dto.login;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class AutoLoginDTO {

    private String email;
    private String sessionId;
    private Date limitTime;
}
