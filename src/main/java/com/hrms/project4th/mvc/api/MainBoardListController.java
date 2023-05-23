package com.hrms.project4th.mvc.api;

import com.hrms.project4th.mvc.dto.page.BoardPage;
import com.hrms.project4th.mvc.dto.page.BoardSearch;
import com.hrms.project4th.mvc.dto.responseDTO.MainBoardInfoResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MainBoardResponseDTO;
import com.hrms.project4th.mvc.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/api/hrms/main-board")
@Slf4j
@Controller
@RequiredArgsConstructor
public class MainBoardListController {
    private final BoardService boardService;

    @GetMapping("/page/{pageNo}")
    public ResponseEntity<?> showMainBoard(
            @PathVariable int pageNo
    ){
        BoardPage boardPage=new BoardPage();
        boardPage.setBoardAmount(7);
        boardPage.setBoardPageNo(pageNo);
        log.info("boardPage {}",boardPage);
        MainBoardInfoResponseDTO mainBoardInfoResponseDTO = boardService.showMainBoard(boardPage);

        return  ResponseEntity.ok().body(mainBoardInfoResponseDTO);
    }

}
