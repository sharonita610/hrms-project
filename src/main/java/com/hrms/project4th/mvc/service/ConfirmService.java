package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.RequestConfirmDto;
import com.hrms.project4th.mvc.dto.ModifyConfirmDto;
import com.hrms.project4th.mvc.entity.Confirm;
import com.hrms.project4th.mvc.repository.ConfirmMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ConfirmService {

    private final ConfirmMapper confirmMapper;

    public List<Confirm> getWaitingList(long empNo, @Nullable Long roleCode) {
        List<Confirm> cinList = confirmMapper.getWaitingList(empNo, roleCode);
        return cinList;
    }

    public boolean requestConfirm(RequestConfirmDto dto) {
        Confirm cnfm = Confirm.builder()
                .fromEmpNo(dto.getFromEmpNo())
                .toEmpNo(dto.getToEmpNo())
                .conTitle(dto.getConTitle())
                .conContent(dto.getConContent())
                .build();
        return confirmMapper.requestConfirm(cnfm);
    }

    public boolean checkConfirm(long conNo) {
        return confirmMapper.checkConfirm(conNo);
    }

    public List<Confirm> getCheckedList(long empNo, Long roleCode) {
        return confirmMapper.getCheckedList(empNo, roleCode);
    }

    public boolean rejectConfirm(long conNo) {
        return confirmMapper.rejectConfirm(conNo);
    }

    public boolean modifyConfirm(ModifyConfirmDto dto) {
        Confirm confirm = Confirm.builder()
                .conNo(dto.getConNo())
                .conTitle(dto.getConTitle())
                .conContent(dto.getConContent())
                .build();
        return confirmMapper.modifyConfirm(confirm);
    }
}
