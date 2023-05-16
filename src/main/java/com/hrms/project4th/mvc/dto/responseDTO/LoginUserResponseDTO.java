package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Builder
public class LoginUserResponseDTO {

    private String empNo;
    private String empName;
    private String email;
    private String profile;
    private String auth;

}
