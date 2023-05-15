package com.hrms.project4th.mvc.dto.responseDTO;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardReplyDetailResponseDTO {


    private long replyNo;
    private String replyContent;
    private long empNo;
    @JsonFormat(pattern = "yyyy년 MM월 dd일 HH:mm")
    private LocalDateTime replyRegDate;

//        private long repNo;
//        private String repContent;
//        private LocalDateTime repDate;
//        private long boardNo;
//        private long empNo;

    public BoardReplyDetailResponseDTO(BoardReply boardReply) {
        this.replyNo = boardReply.getRepNo();
        this.replyContent = boardReply.getRepContent();
        this.empNo = boardReply.getEmpNo();
        this.replyRegDate = boardReply.getRepDate();


    }
}