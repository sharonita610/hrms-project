package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.entity.BoardEmpInfo;
import com.hrms.project4th.mvc.repository.BoardEmpInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardEmpInfoService {
    private final BoardEmpInfoMapper boardEmpInfoMapper;

    public List<BoardEmpInfo> showAllInfo(){


        return boardEmpInfoMapper.showAllInfo();
    }




}
