package com.hrms.project4th.mvc.api;

import com.hrms.project4th.mvc.dto.responseDTO.BoardEmpInfoResponseDTO;
import com.hrms.project4th.mvc.entity.BoardEmpInfo;
import com.hrms.project4th.mvc.service.BoardEmpInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/hrms/boardInfo")
@Slf4j
public class BoardEmpInfoController {
    private final BoardEmpInfoService boardEmpInfoService;

    @GetMapping
    public ResponseEntity<?> showAllInfo(){
        List<BoardEmpInfoResponseDTO> boardEmpInfos = boardEmpInfoService.showAllInfo();
        log.info(" boardEmpInfos : {}", boardEmpInfos);

        return ResponseEntity.ok().body(boardEmpInfos);
    }
}
