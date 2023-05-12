package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.AddEmployeesDTO;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Employees {
    //사원번호
    private long empNo;

    //사원이름
    private String empName;

    //사원생일
    private LocalDate empBirthDay;

    //사원 입사일
    private LocalDate empHireDate;

    //사원 이메일
    private String empEmail;

    //사원 비밀번호
    private String empPassword;

    //사원 성별
    private Gender empGender;

    //사원 급여
    private long empSalary;

    //직원 전화번호
    private String empPhone;

    //사원 직속 상사
    private long empMyBoss;

    //사원 직급
    private String posCode;

    //사원 직책
    private String roleCode;

    //소속 부서
    private String deptCode;

    public Employees(AddEmployeesDTO dto){
        this.empName = dto.getEmpName();
        this.empBirthDay = getLocalDate(dto.getEmpBirthDay());
        this.empEmail = dto.getEmpEmail();
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
        //20201222
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
        return LocalDate.parse(date, dtf);
    }
}
