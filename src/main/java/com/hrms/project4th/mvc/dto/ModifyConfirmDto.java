package com.hrms.project4th.mvc.dto;

import lombok.*;
import org.springframework.stereotype.Component;

@Component
@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyConfirmDto {

    private long conNo;
    private String conTitle;
    private String conContent;
}
