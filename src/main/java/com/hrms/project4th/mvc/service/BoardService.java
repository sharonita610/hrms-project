package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.BoardListResponseDTO;
import com.hrms.project4th.mvc.repository.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper boardMapper;


    public List<BoardListResponseDTO> boardFindAll() {

        return boardMapper.boardFindAll().stream()
                .map(BoardListResponseDTO::new)
                .collect(Collectors.toList());
    }






    /*
    + boardFindAll() : List<BoardListResponseDTO dto>
+ boardFindOne(Long empNo) :
   List<BoardListResponseDTO dto>
+ boardDetail(Long boardNo) : Board
+ boardSave(BoardSaveRequestDTO dto) : boolean
+ boardDelete(BoardDeleteRequestDTO dto)) : boolean
+ boardModify(BoardModifyRequestDTO dto) : boolean
     */


}
