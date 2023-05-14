package com.hrms.project4th.mvc.dto;

import com.hrms.project4th.mvc.entity.CheckStatus;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetConfirmListDTO {
    private long conNo;
    private String conTitle;
    private String fromName;
    private String fromDept;
    private LocalDateTime conDate;
    private CheckStatus conStatus;
    private LocalDateTime conCheckDate;
}
