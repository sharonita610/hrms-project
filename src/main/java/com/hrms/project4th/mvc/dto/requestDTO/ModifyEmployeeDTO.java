package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;
import org.springframework.stereotype.Component;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyEmployeeDTO {

    private long empNo;
    private String empEmail;
    private String empPassword;
    private long empSalary;
    private String empPhone;
    private long empMyBoss;
    private String posCode;
    private String roleCode;
    private String deptCode;
}
