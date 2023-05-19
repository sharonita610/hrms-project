package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyEmployeeDTO {

    private long empNo;
    private String empName;
    private String empPhone;
    private String empEmail;
    private String empPassword;
    private String empBirthDay;
    private long empSalary;
    private String deptCode;
    private String posCode;
    private String roleCode;
    @Nullable
    private Long empMyBoss;
    private MultipartFile profile;
}
