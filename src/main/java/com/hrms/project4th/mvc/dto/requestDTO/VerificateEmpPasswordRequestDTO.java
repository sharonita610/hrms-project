package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class VerificateEmpPasswordRequestDTO {

    private String empNo;
    private String empName;
    private String empEmail;
    private String empBirthDay;
    private String empSalary;
}
