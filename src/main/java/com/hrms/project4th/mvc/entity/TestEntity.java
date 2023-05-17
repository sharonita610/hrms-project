package com.hrms.project4th.mvc.entity;

import lombok.*;

@Builder
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TestEntity {
    private long empNo;
    private String empName;
}
