package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class BoardReplyDeleteRequestDTO {

    private long empNo;
    private long repNo;
    private long boardNo;


    public BoardReply changeEntity() {
        return BoardReply.builder()
                .empNo(this.empNo)
                .repNo(this.repNo)
                .boardNo(this.boardNo)
                .build();
    }


}
