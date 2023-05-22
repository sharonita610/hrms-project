package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.responseDTO.BoardListResponseDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardSaveRequestDTO;
import com.hrms.project4th.mvc.dto.page.BoardPageMaker;
import com.hrms.project4th.mvc.dto.page.BoardSearch;
import com.hrms.project4th.mvc.entity.Board;
import com.hrms.project4th.mvc.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hrms/board")
@Slf4j
public class BoardController {

    private final BoardService boardService;

    // 게시글을 보여주는 기능
    @GetMapping("/board-list")
    public String boardFindAll(BoardSearch search, Model model) {
        List<BoardListResponseDTO> boardListResponseDTOS = boardService.boardFindAll(search);
        log.info("/hrms/board-list : GET {}", boardListResponseDTOS);

        BoardPageMaker boardPageMaker = new BoardPageMaker(search, boardService.boardPageCount(search));
//        log.info("hrms/board-list : GET / boardPageMaker : {}", boardPageMaker);

        model.addAttribute("search", search);
        model.addAttribute("boardPageMaker", boardPageMaker);
        model.addAttribute("allList", boardListResponseDTOS);
        return "/board/boardList";
    }


    // 게시글 save 페이지를 보여주는 기능
    @GetMapping("/board-save")
    public String showBoardSave() {

        return "/board/boardSave";
    }


    // 저장 페이지의 정보를 저장하는 기능
    @PostMapping("/board-save")
    public String boardSave(BoardSaveRequestDTO dto) {
      log.info("BoardSaveRequestDTO {}",dto);
      boardService.boardSave(dto);
        return "redirect:/hrms/board/board-list";
    }

    // 제거 기능
    @GetMapping("/board-delete")
    public String boardDelete(Long boardNo) {
//        log.info("board-delete /  boardNo : {}", boardNo);
        boardService.boardDelete(boardNo);
        return "redirect:/hrms/board/board-list";
    }



    // 상세 보기 페이지를 보여주는 기능
    @GetMapping("/board-detail")
    public String boardDetail(
            BoardSearch search,
            Long boardNo,
            Model model) {
//        log.info("board-detail / boardNo : {} ", boardNo);
        Board board = boardService.boardFindOneByBoardNo(boardNo);
        log.info("detailboard {}",board);
//        log.info("searchInfo : {}", search);
        model.addAttribute("s", search);
        model.addAttribute("b", board);
        return "/board/boardDetail";
    }

    // 게시글 수정 페이지를 보여주는 기능
    @PostMapping("/show-modify")
    public String showModify(Model model, BoardModifyRequestDTO dto,BoardSearch boardSearch) {
//        log.info("/hrms/board-modify : POST / {}", dto);
        log.info("boardSearch : {}",boardSearch);
        model.addAttribute("s",boardSearch);
        model.addAttribute("m", dto);
        return "/board/boardModify";
    }

    // 수정한 값을 입력받아 Detail page 에 다시 띄어준다.
    @PostMapping("/board-modify")
    public String boardModify(BoardModifyRequestDTO dto, Model model, @ModelAttribute("s") BoardSearch search) {
//        log.info("/hrms/board-modify : POST / BoardModifyRequestDTO {}", dto);
        boolean flag = boardService.boardModify(dto);
//        log.info("flag : {}",flag);
//        log.info("searchinfo : {}", search);
        model.addAttribute("b", dto);

        return "redirect:/hrms/board/board-detail?boardNo=" + dto.getBoardNo();
    }


}
