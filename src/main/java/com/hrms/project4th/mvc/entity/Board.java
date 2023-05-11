package com.hrms.project4th.mvc.entity;

import lombok.*;

import java.time.LocalDateTime;
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Board {
    //게시글 번호
    private long boardNo;

    //게시글 종료(공지,자유,익명)
    private BdType bdType;

    //게시글 제목
    private String bdTitle;

    //게시글 내용
    private String bdContent;

    //게시글 작성 시간
    private LocalDateTime bdDate;

    //사원 번호
    private long empNo;


}
