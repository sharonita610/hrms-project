package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.responseDTO.ClubReplyListResponseDTO;
import com.hrms.project4th.mvc.service.ClubReplyService;
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
@Slf4j
@RequestMapping("/hrms/club")
public class ClubReplyController {

    private final ClubReplyService clubReplyService;

    @GetMapping("/myClubReply/{empNo}")
    public ResponseEntity<?> myClubReplyList(@PathVariable Long empNo) {
        List<ClubReplyListResponseDTO> clubReplyMyList = clubReplyService.clubReplyMyList(empNo);

        return ResponseEntity.ok().body(clubReplyMyList);
    }

    @GetMapping("/boardReply/{cbNo}")
    public  ResponseEntity<?> clubBoardReplyList(@PathVariable Long cbNo) {
        List<ClubReplyListResponseDTO> clubReplyListResponseDTOS = clubReplyService.clubReplyListAll(cbNo);

        return ResponseEntity.ok().body(clubReplyListResponseDTOS);
    }

}
