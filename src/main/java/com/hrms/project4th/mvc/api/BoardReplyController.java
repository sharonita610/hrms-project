package com.hrms.project4th.mvc.api;

import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyDeleteRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyModifyRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.BoardReplyListResponseDTO;
import com.hrms.project4th.mvc.dto.requestDTO.BoardReplyWriteRequestDTO;
import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.service.BoardReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLDataException;
import java.sql.SQLException;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/hrms/replies")
@Slf4j
public class BoardReplyController {
    private final BoardReplyService boardReplyService;

    //게시글 댓글 목록 요청
    // URL : /api/hrms/replies/3/page/1 : 3번 게시물의 댓글중 1페이지만 보여주세요!!!
    @GetMapping("/{boardNo}/page/{pageNo}")
    public ResponseEntity<?> showReplyList(
            @PathVariable long boardNo,
            @PathVariable int pageNo
    ) {
        log.info("/api/hrms/replies/{}/page/{} : GET !!", boardNo, pageNo);
        BoardPage page = new BoardPage();
        page.setBoardPageNo(pageNo);
        page.setBoardAmount(10);
        BoardReplyListResponseDTO replyList
                = boardReplyService.findAll(boardNo, page);

        return ResponseEntity.ok().body(replyList);
    }

    //댓글 저장
    @PostMapping
    public ResponseEntity<?> saveReply(
            @RequestBody BoardReplyWriteRequestDTO dto
            , BindingResult result) {

        //검증해서 틀리면 400 error
        if(result.hasErrors()){
            return ResponseEntity.badRequest().body(result.toString());
        }

        log.info("/api/hrms/replies : POST!! / dto : {}", dto);
        try {
            boardReplyService.save(dto);
        } catch (SQLDataException e) {
            // fail
            log.warn("500 error {}", e.getMessage());
            ResponseEntity
                    .internalServerError()
                    .body(e.getMessage());
        }
        //success
        return ResponseEntity.ok().body("success");

    }

    // 댓글 제거
    @DeleteMapping
    public ResponseEntity<?> deleteReply(
            @RequestBody BoardReplyDeleteRequestDTO dto) {
        log.info("/api/hrms/replies : DELETE!! / replyNo : {}", dto);
        try {
            boardReplyService.delete(dto);
        } catch (SQLDataException e) {
            log.warn("500 error {}", e.getMessage());
            ResponseEntity
                    .internalServerError()
                    .body(e.getMessage());
        }

        return ResponseEntity.ok().body("delete success");
    }


    // 댓글 수정
    @PatchMapping
    public ResponseEntity<?> modifyReply(
            @RequestBody BoardReplyModifyRequestDTO dto) {

        try {
            boardReplyService.modify(dto);
        } catch (SQLException e) {
            log.warn("500 error {}", e.getMessage());
            ResponseEntity.internalServerError()
                    .body(e.getMessage());
        }

        return ResponseEntity.ok().body("modify success");


    }


}
