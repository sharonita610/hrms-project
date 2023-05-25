package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import lombok.*;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Employees extends CheckPassword {

    private long empNo;
    private String empName;
    private LocalDate empBirthDay;
    private LocalDate empHireDate;
    private String empEmail;
    private String empPassword;
    private Gender empGender;
    private long empSalary;
    private String empPhone;
    @Nullable
    private Long empMyBoss;
    private String posCode;
    private String roleCode;
    private String deptCode;
    private String profile;
    private LocalDateTime cookieLimitTime;
    private String empSession;
    // db에 컬럼 추가해야됨
    private char autoLogin;


    public Employees(AddEmployeesDTO dto, String path){
        this.empName = dto.getEmpName();
        this.empBirthDay = getLocalDate(dto.getEmpBirthDay());
        this.empEmail = settingEmpEmail(dto.getEmpEmail());
        this.empPhone = dto.getEmpPhone();
        this.empPassword = dto.getEmpPhone().substring(7);
        this.empGender = dto.getEmpGender();
        this.empSalary = dto.getEmpSalary();
        this.empMyBoss = dto.getEmpMyBoss();
        this.posCode = dto.getPosCode();
        this.roleCode = dto.getRoleCode();
        this.deptCode = dto.getDeptCode();
        this.profile = path;
        this.autoLogin = dto.getAutoLogin();
    }

    public Employees(ModifyEmployeeDTO dto, String path){
        this.empNo = dto.getEmpNo();
        this.empName = dto.getEmpName();
        this.empPhone = dto.getEmpPhone();
        this.empEmail = settingEmpEmail(dto.getEmpEmail());
        this.empPassword = dto.getEmpPassword();
        this.empBirthDay = getLocalDate(dto.getEmpBirthDay());
        this.empSalary = dto.getEmpSalary();
        this.deptCode = dto.getDeptCode();
        this.posCode = dto.getPosCode();
        this.roleCode = dto.getRoleCode();
        this.empMyBoss = dto.getEmpMyBoss();
        this.profile = path;
    }

    public Employees(ModifyEmployeeDTO dto){
        this.empNo = dto.getEmpNo();
        this.empName = dto.getEmpName();
        this.empPhone = dto.getEmpPhone();
        this.empEmail = settingEmpEmail(dto.getEmpEmail());
        this.empPassword = dto.getEmpPassword();
        this.empBirthDay = getLocalDate(dto.getEmpBirthDay());
        this.empSalary = dto.getEmpSalary();
        this.deptCode = dto.getDeptCode();
        this.posCode = dto.getPosCode();
        this.roleCode = dto.getRoleCode();
        this.empMyBoss = dto.getEmpMyBoss();
    }

    public LocalDate getLocalDate(String date){
        //2020-12-22
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDate.parse(date, dtf);
    }

    public String settingEmpEmail(String emailAccount){
        return emailAccount + "@samjosangsa.com";
    }



}
