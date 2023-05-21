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
    // 로그인한 객체의 정보를 db에서 클라이언트한데 되돌려줄 정보

    private String empNo;
    private String empName;
    private String empPhone;
    private String empEmail;
    private String posCode;
    private String deptCode;
    private String roleCode;
    private String profile;


}
