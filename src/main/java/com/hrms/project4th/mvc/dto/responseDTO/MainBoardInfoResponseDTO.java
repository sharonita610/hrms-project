package com.hrms.project4th.mvc.dto.responseDTO;

import com.hrms.project4th.mvc.dto.page.BoardPageMaker;
import com.hrms.project4th.mvc.dto.page.MainPageMaker;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@ToString
@Builder
public class MainBoardInfoResponseDTO {

    //댓글수
    private int replyCount;

    //게시판 댓글 리스트
    private List<MainBoardResponseDTO> mainBoardResponseDTOS;

    // 댓글 페이지 정보
    private BoardPageMaker boardPageMaker;

}
