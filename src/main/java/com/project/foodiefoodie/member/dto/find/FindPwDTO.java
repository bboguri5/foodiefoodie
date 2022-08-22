package com.project.foodiefoodie.member.dto.find;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class FindPwDTO {

    private String email;
    private String name;
    private int birth;
    private String phoneNumber;

}
