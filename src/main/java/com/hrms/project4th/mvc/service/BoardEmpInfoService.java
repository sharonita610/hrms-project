package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.responseDTO.BoardEmpInfoResponseDTO;
import com.hrms.project4th.mvc.entity.BoardEmpInfo;
import com.hrms.project4th.mvc.repository.BoardEmpInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BoardEmpInfoService {
    private final BoardEmpInfoMapper boardEmpInfoMapper;

    public List<BoardEmpInfoResponseDTO> showAllInfo(){


        return boardEmpInfoMapper.showAllInfo().stream()
                .map(BoardEmpInfoResponseDTO::new)
                .collect(Collectors.toList());
    }




}
