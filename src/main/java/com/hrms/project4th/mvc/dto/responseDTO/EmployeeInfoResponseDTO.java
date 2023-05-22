package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class EmployeeInfoResponseDTO {
    private long empNo;
    private String empName;
    private String empEmail;
    private String deptName;
    private String roleName;
}
