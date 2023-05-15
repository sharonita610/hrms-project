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
public class SimpleDateConfirmDTO {
    private long conNo;
    private String conTitle;
    private String conContent;
    private String fromName;
    private String fromDept;
    private String conDate;
    private String conStatus;
    private String conCheckDate;

    public SimpleDateConfirmDTO(GetConfirmListDTO dto) {
        this.conNo = dto.getConNo();
        this.conTitle = dto.getConTitle();
        this.conContent = dto.getConContent();
        this.fromName = dto.getFromName();
        this.fromDept = dto.getFromDept();
        this.conDate = getSimpleDate(dto.getConDate());
        this.conStatus = getSimpleStatus(dto.getConStatus());
        this.conCheckDate = getSimpleDate(dto.getConCheckDate());
    }


    public String getSimpleDate(LocalDateTime date) {
        if(date == null) return "";
        // yyyy.MM.dd HH:mm (2022.01.01 00:00)
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
        return dtf.format(date);
    }

    public String getSimpleStatus(CheckStatus status) {
        switch (status) {
            case Y :
                return "승인완료";
            case N :
                return "승인대기";
            case Z :
                return "승인거절";
        }
        return "";
    }
}
