package com.hrms.project4th.mvc.entity;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Confirm {

    private long conNo;
    private String conTitle;
    private String conContent;
    private LocalDateTime conCheckDate;
    private CheckStatus conStatus;
    private long fromEmpNo;
    private long toEmpNo;

}
