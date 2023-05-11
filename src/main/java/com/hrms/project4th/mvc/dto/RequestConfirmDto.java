package com.hrms.project4th.mvc.dto;

import com.hrms.project4th.mvc.entity.CheckStatus;
import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequestConfirmDto {
    private String conTitle;
    private String conContent;
    private long fromEmpNo;
    private long toEmpNo;
}
