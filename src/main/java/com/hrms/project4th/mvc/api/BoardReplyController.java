package com.hrms.project4th.mvc.api;

import com.hrms.project4th.mvc.dto.BoardReplyListResponseDTO;
import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.entity.BoardReply;
import com.hrms.project4th.mvc.service.BoardReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


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
                = boardReplyService.getList(boardNo, page);

        return ResponseEntity.ok().body(replyList);
    }


}
