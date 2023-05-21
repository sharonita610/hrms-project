package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.Employees;
import lombok.*;

@Setter @Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateRequestPhoneNumberDTO {

    private String newPhone;
    private String currentEmail;

//    public UpdateRequestPhoneNumberDTO() {
//
//    }

//    public UpdateRequestPhoneNumberDTO(String newPhone, String currentEmail) {
//        this.newPhone = newPhone;
//        this.currentEmail = currentEmail;
//    }

    public Employees toEntity(){
        return Employees.builder()
                .empPhone(this.newPhone)
                .empEmail(this.currentEmail)
                .build();
    }

}
