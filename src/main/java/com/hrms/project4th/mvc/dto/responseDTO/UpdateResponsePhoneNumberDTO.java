package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateResponsePhoneNumberDTO {

    private String empEmail;
    private String empPhone;
    private String empName;

}
