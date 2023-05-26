package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BdType;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class BoardModifyRequestDTO {

    private long boardNo;
    private BdType bdType;
    private String bdTitle;
    private String bdContent;
    private Long important;
    private long empNo;


}
