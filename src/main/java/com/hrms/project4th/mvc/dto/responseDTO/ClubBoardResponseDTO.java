package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubBoardResponseDTO {

    private long cbNo;
    private String cbTitle;
    private String cbContent;
    private LocalDateTime cbDate;
    private String cbURL;
    private long empNo;
    private long clubCode;
    private String clubName;
    private String empName;
}
