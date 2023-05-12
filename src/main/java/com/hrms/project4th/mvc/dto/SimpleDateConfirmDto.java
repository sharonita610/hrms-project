package com.hrms.project4th.mvc.dto;

import com.hrms.project4th.mvc.entity.CheckStatus;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SimpleDateConfirmDto {
    private long conNo;
    private String conTitle;
    private String fromName;
    private String fromDept;
    private String conDate;
    private CheckStatus conStatus;

    public SimpleDateConfirmDto(getConfirmListDto dto){
        this.conNo = dto.getConNo();
        this.conTitle = dto.getConTitle();
        this.fromName = dto.getFromName();
        this.fromDept = dto.getFromDept();
        this.conDate = getSimpleDate(dto.getConDate());
        this.conStatus = dto.getConStatus();
    }

    public String getSimpleDate(LocalDateTime date){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
        return dtf.format(date);
    }
}
