package com.hrms.project4th.mvc.entity;

import lombok.*;

import java.time.LocalDateTime;


@Builder
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class BoardReply {

    private long repNo;
    private String repContent;
    private LocalDateTime repDate;
    private long boardNo;
    private long empNo;
    private String deptName;
    private String posName;
    private String roleName;
    private String empName;


}
