package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.Gender;
import lombok.*;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class EmployeeDetailResponseDTO {
    private long empNo;
    private String empName;
    private String empBirthDay;
    private String empHireDate;
    private String empEmail;
    private String empPassword;
    private Gender empGender;
    private long empSalary;
    private String empPhone;
    private String empMyBoss;
    private String posName;
    private String roleName;
    private String deptName;
    private String clubName;
}
