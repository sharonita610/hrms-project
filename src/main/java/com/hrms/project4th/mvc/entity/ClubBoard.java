package com.hrms.project4th.mvc.entity;

import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardSaveRequestDTO;
import lombok.*;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

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

        public ClubBoard(ClubBoardSaveRequestDTO dto, String savePath) {
                this.cbTitle = dto.getCbTitle();
                this.cbContent = dto.getCbContent();
                this.cbURL = savePath;
                this.empNo = dto.getEmpNo();
                this.clubCode = dto.getClubCode();
        }


        public ClubBoard(ClubBoardModifyRequestDTO dto, String savePath) {
                this.cbNo = dto.getCbNo();
                this.cbTitle = dto.getCbTitle();
                this.cbContent = dto.getCbContent();
                this.cbURL = savePath;
        }
}
