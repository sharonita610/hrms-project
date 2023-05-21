package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.Gender;
import lombok.*;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddEmployeesDTO {

    private String empName;
    private String empBirthDay;
    private String empEmail;
    private Gender empGender;
    private long empSalary;
    private String empPhone;
    private long empMyBoss;
    private String posCode;
    private String roleCode;
    private String deptCode;
    private MultipartFile profile;
    private char autoLogin;
}
