package com.hrms.project4th.mvc.dto.requestDTO;

import lombok.*;
import org.springframework.stereotype.Component;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubBoardModifyRequestDTO {

    private Long cbNo;
    private String cbTitle;
    private String cbContent;
    private String cbURL;

}
