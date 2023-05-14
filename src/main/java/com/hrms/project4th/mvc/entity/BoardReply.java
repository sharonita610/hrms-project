package com.hrms.project4th.mvc.entity;

import lombok.*;

import java.time.LocalDateTime;

/*select * from hr_board;
create table HR_REPLY(
REP_NO INT(10) auto_increment,
REP_CONTENT VARCHAR(100) not null,
REP_DATE DATETIME default CURRENT_TIMESTAMP,
BOARD_NO INT(10),
EMP_NO INT(10),
constraint PK_REP_NO primary key (REP_NO),
constraint FK_BOARD_NO foreign key (BOARD_NO)
references HR_BOARD(BOARD_NO) on delete CASCADE
);
* */
@Builder
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class BoardReply {
    private long repNo;
    private String repContent;
    private LocalDateTime repDate;
    private long boardNo;
    private long empNo;

}
