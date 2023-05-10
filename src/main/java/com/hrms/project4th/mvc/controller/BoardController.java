package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.BoardListResponseDTO;
import com.hrms.project4th.mvc.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hrms")
@Slf4j
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/board-list")
    public String boardFindAll(Model model) {
        List<BoardListResponseDTO> boardListResponseDTOS = boardService.boardFindAll();
        log.info("/hrms/board-list : GET {}",boardListResponseDTOS);

        model.addAttribute("allList", boardListResponseDTOS);
        return "boardList";
    }


}
