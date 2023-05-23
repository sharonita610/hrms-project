package com.hrms.project4th.mvc.dto.responseDTO;

import lombok.*;
import org.springframework.stereotype.Component;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubBoardListResponseDTO {
    private String empName;
}
