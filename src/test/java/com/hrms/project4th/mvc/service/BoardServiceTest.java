package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.page.BoardSearch;
import com.hrms.project4th.mvc.dto.requestDTO.BoardSaveRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MainBoardInfoResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MainBoardResponseDTO;
import com.hrms.project4th.mvc.entity.Board;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class BoardServiceTest {

    @Autowired
    BoardService boardService;

        @Test
        @DisplayName("important 값 넣어서 save기능 작동하는지 여부")
        void importantsave(){
            BoardSaveRequestDTO build = BoardSaveRequestDTO.builder().important(1).empNo(500).bdTitle("1234").bdContent("12345").build();


            boolean b = boardService.boardSave(build);


        }

    @Test
    @DisplayName("DB에서 불러온 게시판의 정보를 dto를 이용하여 타입변경과 짧게 만들어 보여주는 기능")
    void findAllTest(){
//        List<BoardListResponseDTO> b = boardService.boardFindAll();
//        System.out.println("b = " + b);


    }
    @Test
    @DisplayName("MAIN 화면에 보여줄 BoardList 잘나오는지 확인!")
    void showMainBoard(){
        BoardSearch search=new BoardSearch();
        MainBoardInfoResponseDTO mainBoardInfoResponseDTO = boardService.showMainBoard(search);
        System.out.println(mainBoardInfoResponseDTO);
    }


}