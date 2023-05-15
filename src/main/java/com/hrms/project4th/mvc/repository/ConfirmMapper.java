package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.entity.Confirm;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.Nullable;

import java.util.List;

@Mapper
public interface ConfirmMapper {

    List<Confirm> getWaitingList(long empNo, @Nullable Long roleCode);

    boolean requestConfirm(Confirm confirm);

    boolean checkConfirm(long conNo);

    boolean rejectConfirm(long conNo);

    List<Confirm> getCheckedList(long empNo, Long roleCode);

    boolean modifyConfirm(Confirm confirm);
}
