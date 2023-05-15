package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;
import org.springframework.stereotype.Component;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class MyClubBoardResponseDTO {

    private Long cbNo;
    private String cbTitle;
    private Long empNo;
    private Long clubCode;
}
