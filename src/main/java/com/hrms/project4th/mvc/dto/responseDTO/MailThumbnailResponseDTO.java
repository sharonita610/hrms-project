package com.hrms.project4th.mvc.dto.responseDTO;


import com.hrms.project4th.mvc.entity.CheckStatus;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
//비동기요청으로화면에 보내줄 포장용 객체
public class MailThumbnailResponseDTO {

    private Long mailNo;

    private String senderName;

    private CheckStatus mailStatus;

}
