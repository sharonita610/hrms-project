package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.Gender;
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

    private long empNo;
    private String empName;
    private String empBirthDay;
    private String empHireDate;
    private String empEmail;
    private Gender empGender;
    private long empSalary;
    private String empPhone;
    private String empBossName;
    private long empMyBoss;
    private String posCode;
    private String posName;
    private String roleCode;
    private String roleName;
    private String deptCode;
    private String deptName;
    private String profile;


}
