package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;

@Setter @Getter
@NoArgsConstructor
@ToString @EqualsAndHashCode
public class LoginRequestDTO {

    private String empEmail;
    private String empPassword;
//    private boolean autoLogin;
}
