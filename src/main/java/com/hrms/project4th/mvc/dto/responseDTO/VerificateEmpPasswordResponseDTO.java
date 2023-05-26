package com.hrms.project4th.mvc.dto.responseDTO;


import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Builder
public class VerificateEmpPasswordResponseDTO {
    private String empNo;
    private String empName;
    private String empMail;
    private String empBirthDay;
    private String empSalary;
    private String empPassword;

}
