package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;
import org.springframework.stereotype.Component;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubReplyModifyRequestDTO {

    private long clubRepNo;
    private String clubRepContent;
    private long cbNo;
    private long empNo;
}
