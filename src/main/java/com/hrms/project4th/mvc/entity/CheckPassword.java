package com.hrms.project4th.mvc.entity;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CheckPassword {
    private String empEmail;
    private String empPassword;
}
