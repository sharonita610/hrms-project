package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.requestDTO.ClubJoinRequestDTO;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class EmpClub {
    private long ecIndex;
    private LocalDateTime empJoinDate;
    private long empNo;
    private long clubCode;

    public EmpClub(ClubJoinRequestDTO dto) {
        this.empNo = dto.getEmpNo();
        this.clubCode = dto.getClubCode();
    }
}
