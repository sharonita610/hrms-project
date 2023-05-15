package com.hrms.project4th.mvc.entity;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubReply {
    private long clubRepNo;
    private String clubRepContent;
    private LocalDateTime clubRepDate;
    private long cbNo;
    private long empNo;
}
