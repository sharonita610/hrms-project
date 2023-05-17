package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Employees {

    private long empNo;
    private String empName;
    private LocalDate empBirthDay;
    private LocalDate empHireDate;
    private String empEmail;
    private String empPassword;
    private Gender empGender;
    private long empSalary;
    private String empPhone;
    private long empMyBoss;
    private String posCode;
    private String roleCode;
    private String deptCode;
    private String profile;

    public Employees(AddEmployeesDTO dto){
        this.empName = dto.getEmpName();
        this.empBirthDay = getLocalDate(dto.getEmpBirthDay());
        this.empEmail = setEmpEmail(dto.getEmpEmail());
        this.empPhone = dto.getEmpPhone();
        this.empPassword = dto.getEmpPhone().substring(7);
        this.empGender = dto.getEmpGender();
        this.empSalary = dto.getEmpSalary();
        this.empMyBoss = dto.getEmpMyBoss();
        this.posCode = dto.getPosCode();
        this.roleCode = dto.getRoleCode();
        this.deptCode = dto.getDeptCode();
    }

    public LocalDate getLocalDate(String date){
        //2020-12-22
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDate.parse(date, dtf);
    }

    public String setEmpEmail(String emailAccount){
        return emailAccount + "@samjosangsa.com";
    }
}
