package com.hrms.project4th.mvc.dto;

import lombok.*;
import org.springframework.stereotype.Component;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubJoinRequestDTO {

    private Long empNo;
    private Long clubCode;
}
