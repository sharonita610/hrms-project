package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardSaveRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubBoardResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MyClubBoardResponseDTO;
import com.hrms.project4th.mvc.entity.ClubBoard;
import com.hrms.project4th.mvc.repository.ClubBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ClubBoardService {

    private final ClubBoardMapper clubBoardMapper;

    // 동호회 게시글 전체 조회
    public List<ClubBoardResponseDTO> findAllClubBoard() {
        List<ClubBoardResponseDTO> dto = clubBoardMapper.findAllClubBoard();
        return dto;
    }
    // 내가 가입한 동호회 게시글만 조회
    public List<ClubBoardResponseDTO> findByEmpNoClubBoard(Long empNo) {
        List<ClubBoardResponseDTO> dto = clubBoardMapper.findByEmpNoClubBoard(empNo);
        return dto;
    }
    // 내가 작성한 게시글 목록 조회
    public List<MyClubBoardResponseDTO> myClubBoardList(Long empNo) {
        return clubBoardMapper.myClubBoardList(empNo);
    }
    // 게시글 클릭시 해당 게시글 하나만 상세 조회
    public ClubBoardResponseDTO detailClubBoard(Long cbNo) {
        return clubBoardMapper.detailClubBoard(cbNo);
    }
    // 동호회 새 게시글 등록
    public boolean clubBoardSave(ClubBoardSaveRequestDTO dto, String savePath) {
        return clubBoardMapper.clubBoardSave(new ClubBoard(dto, savePath));
    }
    // 동호회 게시글 삭제
    public boolean clubBoardDelete(Long cbNo) {
        return clubBoardMapper.clubBoardDelete(cbNo);
    }
    // 동호회 게시글 수정
    public boolean clubBoardModify(ClubBoardModifyRequestDTO dto, String savePath) {
        return clubBoardMapper.clubBoardModify(new ClubBoard(dto, savePath));
    }


}
