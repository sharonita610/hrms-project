package com.hrms.project4th.mvc.dto;

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Builder
public class AutoLoginDTO {

    private String empSession;
    private LocalDateTime cookieLimitTime;
    private String empEmail;
}
