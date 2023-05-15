package com.hrms.project4th.mvc.dto;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubBoardSaveRequestDTO {

    private String cbTitle;
    private String cbContent;
    private String cbURL;
    private long empNo;
    private long clubCode;
}
