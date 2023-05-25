package com.hrms.project4th.mvc.entity;

import lombok.*;
@Builder
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BoardEmpInfo {


    private long empNo;
    private String empName;
    private String empEmail;
    private String empPhone;
    private String deptName;
    private String posName;
    private Gender empGender;
    private String profile;





}
