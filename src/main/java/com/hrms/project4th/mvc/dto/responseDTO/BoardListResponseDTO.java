package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.entity.Board;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@ToString
@Getter
public class BoardListResponseDTO {
    private Long boardNo;
    private String bdType;
    private String shortTitle;
    private String shortContent;
    private String stringDate;
    private Long empNo;
    private String empName;
    private long viewCount;

    public BoardListResponseDTO(Board board) {
        this.boardNo = board.getBoardNo();
        this.bdType = String.valueOf(board.getBdType());
        this.shortTitle = makeShortTitle(board.getBdTitle());
        this.shortContent = makeShortContent(board.getBdContent());
        this.stringDate=makeStringDate(board.getBdDate());
        this.empNo = board.getEmpNo();
        this.empName= board.getEmpName();
        this.viewCount=board.getViewCount();
    }


    /**
     * LocalDateTime 타입의 데이터를 String 으로 바꿔주는 기능
     *
     * @param bdDate LocalDateTime 날짜
     * @return 패턴화된 String
     */
    public static String makeStringDate(LocalDateTime bdDate) {
        DateTimeFormatter pattern =DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(bdDate);
    }

    /**
     * 게시글의 내용을 줄여서 리턴하는 기능
     *
     * @param bdContent 게시글 내용
     * @return 짧아진 게시글 내용
     */
    public String makeShortContent(String bdContent) {
        return makeShort(bdContent, 30);
    }

    /**
     * 게시글의 제목을 줄여서 리턴하는 기능
     *
     * @param bdTitle 게시글 제목
     * @return 짧아진 게시글 제목
     */
    public String makeShortTitle(String bdTitle) {
        return makeShort(bdTitle, 20);
    }


    /**
     * String 타입의 문자열를 일정 길이로 잘라주는 기능
     *
     * @param textString String타입의 문자열
     * @param len 제한길이
     * @return 짧아진 문자열
     */
    public static String makeShort(String textString, int len) {
        return (textString.length() > len) ? textString.substring(0, len) + "..." : textString;
    }




}

