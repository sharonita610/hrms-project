package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.requestDTO.ClubReplyModifyRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubReplyListResponseDTO;
import com.hrms.project4th.mvc.entity.ClubReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubReplyMapper {
    boolean clubReplySave(ClubReply clubReply); // 동호회 게시글 댓글 등록
    List<ClubReplyListResponseDTO> clubReplyListAll(Long cbNo); // 클릭한 게시글 댓글 전체 조회
    List<ClubReplyListResponseDTO> clubReplyMyList(Long empNo); // 내가 작성한 댓글 목록 조회
    boolean clubReplyDelete(Long clubRepNo);    // 동호회 게시글 댓글 삭제
    boolean clubReplyModify(ClubReply clubReply);  // 동호회 게시글 댓글 수정

}
