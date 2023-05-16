package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubReplyListResponseDTO {

    private long clubRepNo;
    private String clubRepContent;
    private LocalDateTime clubRepDate;
    private long cbNo;
    private long empNo;
    private String empName;
}
