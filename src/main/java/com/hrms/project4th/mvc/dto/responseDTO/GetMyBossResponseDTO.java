package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.Employees;
import lombok.*;

import java.lang.reflect.Member;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class GetMyBossResponseDTO {

    long empNo;
    String empName;

    public GetMyBossResponseDTO(Employees emp){
        this.empNo = emp.getEmpNo();
        this.empName = emp.getEmpName();
    }
}
