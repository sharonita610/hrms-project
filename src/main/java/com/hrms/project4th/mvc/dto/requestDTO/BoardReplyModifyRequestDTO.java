package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardReplyModifyRequestDTO {

    private long repNo;
    private String repContent;
    private long boardNo;
    private long empNo;

    public BoardReply changeEntity() {
        return BoardReply.builder()
                .repNo(this.repNo)
                .repContent(this.repContent)
                .boardNo(this.boardNo)
                .empNo(this.empNo)
                .build();
    }

}
