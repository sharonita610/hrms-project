package com.hrms.project4th.mvc.dto;

import com.hrms.project4th.mvc.entity.BdType;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;
@Getter
@ToString
@Builder
public class BoardModifyRequestDTO {

    private long boardNo;
    private String bdType;
    private String bdTitle;
    private String bdContent;
//    private long empNo;




}
