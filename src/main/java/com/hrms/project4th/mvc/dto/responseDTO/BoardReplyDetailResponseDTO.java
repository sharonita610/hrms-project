package com.hrms.project4th.mvc.dto.responseDTO;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardReplyDetailResponseDTO {


    private long repNo;
    private String repContent;
    private long empNo;
    @JsonFormat(pattern = "yyyy년 MM월 dd일 HH:mm")
    private String replyRegDate;

//        private long repNo;
//        private String repContent;
//        private LocalDateTime repDate;
//        private long boardNo;
//        private long empNo;

    public BoardReplyDetailResponseDTO(BoardReply boardReply) {
        this.repNo = boardReply.getRepNo();
        this.repContent = boardReply.getRepContent();
        this.empNo = boardReply.getEmpNo();
        this.replyRegDate = makeString(boardReply.getRepDate());
    }

    public String makeString(LocalDateTime localDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy:MM:dd HH:mm");
        return pattern.format(localDateTime);

    }
}