
package com.hrms.project4th.mvc.entity;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class Club {

    private long clubCode;
    private String clubName;
    private LocalDateTime clubDate;
    private long empNo;
}