package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.responseDTO.ClubBoardResponseDTO;
import com.hrms.project4th.mvc.service.ClubBoardService;
import com.hrms.project4th.mvc.service.ClubJoinService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/club")
public class ClubController {

    private  final ClubBoardService clubBoardService;
    private final ClubJoinService clubJoinService;

    @GetMapping("/club-board-list")
    public String clubBoardList(Model model) {

        List<ClubBoardResponseDTO> dto = clubBoardService.findAllClubBoard();
        model.addAttribute("clubBoardList", dto);
        return "club/club";
    }

    @GetMapping("/joined-club-board-list")
    public String joinedClubBoardList(Model model, Long empNo) {

        List<ClubBoardResponseDTO> dto = clubBoardService.findByEmpNoClubBoard(empNo);
        model.addAttribute("clubBoardList", dto);
        log.info("dto : ", dto, empNo);
        return "club/club";
    }



}
