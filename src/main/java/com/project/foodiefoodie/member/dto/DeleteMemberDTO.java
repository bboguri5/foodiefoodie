package com.project.foodiefoodie.member.dto;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class DeleteMemberDTO {
    private String email;
    private String password;
}
