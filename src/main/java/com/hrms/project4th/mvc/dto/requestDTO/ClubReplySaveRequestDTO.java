package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubReplySaveRequestDTO {

    private String clubRepContent;
    private long cbNo;
    private long empNo;
}
