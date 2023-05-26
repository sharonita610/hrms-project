package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;

@Setter @Getter
@NoArgsConstructor
@ToString @EqualsAndHashCode
public class LoginRequestDTO {
    // 최초 로그인시 client 로부터 받아야되는 정보
    
    private String empEmail;
    private String empPassword;
    private boolean autoLogin;
}
