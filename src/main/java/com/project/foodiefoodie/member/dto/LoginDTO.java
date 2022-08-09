package com.project.foodiefoodie.member.dto;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class LoginDTO {

    private String email;
    private String password;
    private boolean autoLogin;

}
