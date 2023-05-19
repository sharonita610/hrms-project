package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class JoinedClubListResponseDTO {

    private long ecIndex;
    private LocalDateTime empJoinDate;
    private long empNo;
    private long clubCode;
    private String clubName;
}
