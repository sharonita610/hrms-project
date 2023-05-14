package com.hrms.project4th.mvc.dto;

import lombok.*;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequestConfirmDTO {
    private String conTitle;
    private String conContent;
    private long fromEmpNo;
    private long toEmpNo;
}
