package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.ClubBoardSaveRequestDTO;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ClubBoard {

        private long cbNo;
        private String cbTitle;
        private String cbContent;
        private LocalDateTime cbDate;
        private String cbURL;
        private long empNo;
        private long clubCode;


        public ClubBoard(ClubBoardSaveRequestDTO dto) {
                this.cbTitle = dto.getCbTitle();
                this.cbContent = dto.getCbContent();
                this.cbURL = dto.getCbURL();
                this.empNo = dto.getEmpNo();
                this.clubCode = dto.getClubCode();
        }

        public ClubBoard(ClubBoardModifyRequestDTO dto) {
                this.cbNo = dto.getCbNo();
                this.cbTitle = dto.getCbTitle();
                this.cbContent = dto.getCbContent();
                this.cbURL = dto.getCbURL();
        }
}
