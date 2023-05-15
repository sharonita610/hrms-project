package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class BoarReplyDeleteRequestDTO {

    private long empNo;
    private long replyNo;


    public BoardReply changeEntity() {
        return BoardReply.builder()
                .empNo(this.empNo)
                .repNo(this.replyNo)
                .build();
    }


}
