package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardSaveRequestDTO;
import com.hrms.project4th.mvc.entity.ClubBoard;
import com.hrms.project4th.mvc.repository.ClubBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ClubBoardService {

    private final ClubBoardMapper clubBoardMapper;

    // 동호회 새 게시글 등록
    public boolean clubBoardSave(ClubBoardSaveRequestDTO dto) {
        return clubBoardMapper.clubBoardSave(new ClubBoard(dto));
    }
    // 동호회 게시글 삭제
    public boolean clubBoardDelete(Long cbNo) {
        return clubBoardMapper.clubBoardDelete(cbNo);
    }
    // 동호회 게시글 수정
    public boolean clubBoardModify(ClubBoardModifyRequestDTO dto) {
        return clubBoardMapper.clubBoardModify(new ClubBoard(dto));
    }
}
