package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.ClubReplyModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubReplySaveRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubReplyListResponseDTO;
import com.hrms.project4th.mvc.entity.ClubReply;
import com.hrms.project4th.mvc.repository.ClubReplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ClubReplyService {

    private final ClubReplyMapper clubReplyMapper;

    // 동호회 게시글 댓글 등록
    public boolean clubReplySave(ClubReplySaveRequestDTO dto) {
        return clubReplyMapper.clubReplySave(new ClubReply(dto));
    }

    // 클릭한 게시글의 댓글 전체 조회
   public List<ClubReplyListResponseDTO> clubReplyListAll(Long cbNo) {
        return clubReplyMapper.clubReplyListAll(cbNo);
    }

    // 내가 작성한 댓글 목록만 조회
    public List<ClubReplyListResponseDTO> clubReplyMyList(Long empNo) {
        return clubReplyMapper.clubReplyMyList(empNo);
    }

    // 동호회 게시글 댓글 삭제
   public boolean clubReplyDelete(Long clubRepNo) {
        return clubReplyMapper.clubReplyDelete(clubRepNo);
    }

    // 동호회 게시글 댓글 수정
    public boolean clubReplyModify(ClubReplyModifyRequestDTO dto) {
        return clubReplyMapper.clubReplyModify(new ClubReply(dto));
    }
}
