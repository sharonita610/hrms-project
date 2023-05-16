package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;

@Setter @Getter
@NoArgsConstructor
@ToString @EqualsAndHashCode
public class LoginRequestDTO {

    private Long empNo;
    private String password;
    private boolean autoLogin;
}
