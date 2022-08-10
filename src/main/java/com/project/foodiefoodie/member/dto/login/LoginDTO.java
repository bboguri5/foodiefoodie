package com.project.foodiefoodie.member.dto.login;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class LoginDTO {

    private String email;
    private String password;
    private boolean autoLogin;

}
