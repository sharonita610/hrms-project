package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.responseDTO.ClubBoardResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MyClubBoardResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.Gender;
import com.hrms.project4th.mvc.service.ClubBoardService;
import com.hrms.project4th.mvc.service.ClubJoinService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
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

        Employees exEmp = Employees.builder()
                .empNo(1L)
                .empName("홍길동")
                .empEmail("1@test.com")
                .empPassword("1234")
                .empGender(Gender.M)
                .build();

        List<ClubBoardResponseDTO> dto = clubBoardService.findAllClubBoard();
        model.addAttribute("clubBoardList", dto);

        for (ClubBoardResponseDTO clubBoardResponseDTO : dto) {
            System.out.println("clubBoardResponseDTO = " + clubBoardResponseDTO);
        }

        log.info("exEmp : {} ", exEmp);
        model.addAttribute("exEmp", exEmp);

        return "club/club";
    }

    @GetMapping("/joined-club-board-list")
    public String joinedClubBoardList(Model model, Long empNo) {

        Employees exEmp = Employees.builder()
                .empNo(1L)
                .empName("홍길동")
                .empEmail("1@test.com")
                .empPassword("1234")
                .empGender(Gender.M)
                .build();

        List<ClubBoardResponseDTO> dto = clubBoardService.findByEmpNoClubBoard(empNo);
        model.addAttribute("clubBoardList", dto);

        model.addAttribute("exEmp", exEmp);
        log.info("exEmp : ", exEmp);
        log.info("dto : ", dto, empNo);
        return "club/club";
    }

    @ResponseBody
    @GetMapping("/myboardList/{empNo}")
    public ResponseEntity<?> myClubBoardList(@PathVariable Long empNo) {
        List<MyClubBoardResponseDTO> myClubBoardResponseDTOS = clubBoardService.myClubBoardList(empNo);
        log.info("good: ",myClubBoardResponseDTOS);

        return ResponseEntity.ok().body(myClubBoardResponseDTOS);
    }



}
