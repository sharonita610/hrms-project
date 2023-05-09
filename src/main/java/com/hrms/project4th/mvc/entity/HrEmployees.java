package com.hrms.project4th.mvc.entity;

import lombok.*;

import java.time.LocalDateTime;

/*
CREATE TABLE HR_EMPLOYEES(
EMP_NO INT(10) AUTO_INCREMENT,
EMP_NAME VARCHAR(20) NOT NULL,
EMP_BIRTH_DAY DATE,
EMP_HIRE_DATE DATE,
EMP_EMAIL VARCHAR(30),
EMP_GENDER CHAR(1),
EMP_SALARY INT(15),
EMP_MY_BOSS INT(10),
PRIMARY KEY (EMP_NO),
FOREIGN KEY (EMP_MY_BOSS) REFERENCES HR_EMPLOYEES(EMP_NO)
);
 */
@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HrEmployees {
    private int empNo;
    private String empName;
    private LocalDateTime empBirthDay;
    private LocalDateTime empHireDate;
    private String empEmail;
    private Gender empGender;
    private int empSalary;
    private int empMyBoss;
}