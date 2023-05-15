package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.GetConfirmListDTO;
import com.hrms.project4th.mvc.entity.Confirm;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.Nullable;

import java.util.List;

@Mapper
public interface ConfirmMapper {

    List<GetConfirmListDTO> getWaitingList(long empNo, @Nullable String roleCode);

    boolean requestConfirm(Confirm confirm);

    boolean checkConfirm(long conNo);

    boolean rejectConfirm(long conNo);

    List<GetConfirmListDTO> getCheckedList(long empNo, String roleCode);

    boolean modifyConfirm(Confirm confirm);

    List<GetConfirmListDTO> getRejectedList(long empNo, String roleCode);

    GetConfirmListDTO findOne(long conNo);

    boolean deleteConfirm(long conNo);
}
