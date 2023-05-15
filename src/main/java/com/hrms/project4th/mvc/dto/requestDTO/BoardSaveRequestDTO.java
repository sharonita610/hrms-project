package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BdType;
import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class BoardSaveRequestDTO {

    private BdType bdType;
    private String bdTitle;
    private String bdContent;
    private long empNo;


}
