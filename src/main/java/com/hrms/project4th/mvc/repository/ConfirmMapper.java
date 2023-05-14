package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.DeptBossDTO;
import com.hrms.project4th.mvc.dto.getConfirmListDTO;
import com.hrms.project4th.mvc.entity.Confirm;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.Nullable;

import java.util.List;

@Mapper
public interface ConfirmMapper {

    List<getConfirmListDTO> getWaitingList(long empNo, @Nullable String roleCode);

    boolean requestConfirm(Confirm confirm);

    boolean checkConfirm(long conNo);

    boolean rejectConfirm(long conNo);

    List<getConfirmListDTO> getCheckedList(long empNo, String roleCode);

    boolean modifyConfirm(Confirm confirm);

    List<getConfirmListDTO> getRejectedList(long empNo, String roleCode);

}
