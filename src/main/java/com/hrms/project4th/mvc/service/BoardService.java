package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.BoardDetailRequestDTO;
import com.hrms.project4th.mvc.dto.BoardListResponseDTO;
import com.hrms.project4th.mvc.dto.BoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.BoardSaveRequestDTO;
import com.hrms.project4th.mvc.dto.Page.BoardPage;
import com.hrms.project4th.mvc.dto.Page.BoardSearch;
import com.hrms.project4th.mvc.entity.Board;
import com.hrms.project4th.mvc.repository.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper boardMapper;

    /**
     * 모든 게시글을 보여주는 기능
     *
     * @return DTO 타입의 List
     */
    public List<BoardListResponseDTO> boardFindAll(BoardSearch search) {

        return boardMapper.boardFindAll(search).stream()
                .map(BoardListResponseDTO::new)
                .collect(Collectors.toList());
    }

    /**
     * 특정 사원의 게시글만 리스트화 해서 보여주는 기능
     *
     * @param empNo 사번
     * @return 특정 사원의 DTO 타입 List
     */
    public List<BoardListResponseDTO> boardFindOneByEmp(Long empNo) {

        return boardMapper.boardFindOneByEno(empNo).stream()
                .map(BoardListResponseDTO::new)
                .collect(Collectors.toList());
    }

    /**
     * 게시글 번호를 입력받아 게시물을 보여주는 기능
     *
     * @param boardNo 게시글 번호
     * @return Board 객체
     */
    public Board boardFindOneByBoardNo(Long boardNo) {

        return boardMapper.boardFindOneByBoardNo(boardNo);
    }

    /**
     * 게시글 번호를 입력받아 dto 로 변환하여 보여주는 기능
     *
     * @param boardNo 게시글 번호
     * @return BoardDetailRequestDTO 객체
     */
    public BoardDetailRequestDTO boardDetail(Long boardNo) {
        Board board = boardFindOneByBoardNo(boardNo);

        return new BoardDetailRequestDTO(board);
    }

    /**
     * 게시글 정보를 받아 저장하는 기능
     *
     * @param dto 저장하기 위한 정보를 받는 DTO
     * @return SAVE 성공 TRUE / 실패 FALSE
     */

    public boolean boardSave(BoardSaveRequestDTO dto) {

        return boardMapper.boardSave(new Board(dto));
    }

    /**
     * 주어진 게시글 번호를 제거하는 기능
     *
     * @param boardNo 게시글 번호
     * @return 삭제 성공 TRUE / 삭제 실패 FALSE
     */
    public boolean boardDelete(Long boardNo) {

        return boardMapper.boardDelete(boardNo);
    }

    /**
     * DTO 를 ENTITY 로 변환하여 MAPPER로 전달하는 기능
     *
     * @param dto 수정정보를 담은 객체
     * @return 수정 성공 TRUE / 수정 실패 FALSE
     */
    public boolean boardModify(BoardModifyRequestDTO dto) {

        return boardMapper.boardModify(new Board(dto));
    }


}
