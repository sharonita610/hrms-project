package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.BoardDetailRequestDTO;
import com.hrms.project4th.mvc.dto.BoardListResponseDTO;
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
    public List<BoardListResponseDTO> boardFindAll() {

        return boardMapper.boardFindAll().stream()
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

    public Board boardFindOneByBoardNo(Long boardNo){

        return boardMapper.boardFindOne(
    }

    /**
     * 특정 게시물을 자세하게 보여주는 기능
     *
     * @param boardNo 게시글 번호
     * @return Board 객체
     */
    public BoardDetailRequestDTO boardDetail(Long boardNo) {


        return new BoardDetailRequestDTO();

    }


    /*
+ boardFindAll() : List<BoardListResponseDTO dto>
+ boardFindOne(Long empNo) : List<BoardListResponseDTO dto>
+ boardDetail(Long boardNo) : Board
+ boardSave(BoardSaveRequestDTO dto) : boolean
+ boardDelete(BoardDeleteRequestDTO dto)) : boolean
+ boardModify(BoardModifyRequestDTO dto) : boolean
     */


}
