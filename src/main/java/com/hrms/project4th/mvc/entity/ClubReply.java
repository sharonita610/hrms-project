package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.requestDTO.ClubReplyModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubReplySaveRequestDTO;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

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

    public ClubReply(ClubReplySaveRequestDTO dto) {
        this.clubRepContent = dto.getClubRepContent();
        this.cbNo = dto.getCbNo();
        this.empNo = dto.getEmpNo();
    }

    public ClubReply(ClubReplyModifyRequestDTO dto) {
        this.clubRepNo = dto.getClubRepNo();
        this.clubRepContent = dto.getClubRepContent();
        this.cbNo = dto.getCbNo();
        this.empNo = dto.getEmpNo();
    }
}
