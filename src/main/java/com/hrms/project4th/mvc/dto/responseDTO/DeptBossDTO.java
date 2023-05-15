package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;
import org.springframework.stereotype.Component;

@Component
@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DeptBossDTO {
    long empNo;
    private String empName;
    private String deptName;
    private String roleCode;
}
