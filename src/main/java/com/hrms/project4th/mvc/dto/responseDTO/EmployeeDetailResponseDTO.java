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
    private String empBossName;
    private long empMyBoss;
    private String posCode;
    private String posName;
    private String roleCode;
    private String roleName;
    private String deptCode;
    private String deptName;
    private String profile;

    public void profileWithRootPath(String profile){
        if(profile != null && profile.contains("C:/hrms/employeesProfile/")) {
            this.profile = profile.replace("C:/hrms/employeesProfile/", "/hrms/");
        }
    }

    public void gettingEmailAccount(String empEmail){
        if(empEmail != null && empEmail.contains("@")) {
            this.empEmail = empEmail.split("@")[0];
        }
    }
}
