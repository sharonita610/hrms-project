package com.hrms.project4th.mvc.api;


import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeInfoResponseDTO;
import com.hrms.project4th.mvc.service.EmployeesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/hrms/search")
@Slf4j
public class EmployeeInfoController {

    private final EmployeesService employeesService;

    //이름에 맞는 사원 검색하기
    //이름이 맞는 사원의 사번 이메일 이름 직책코드 부서코드 알려주세요
    @GetMapping("/empName/{empName}")
    public ResponseEntity<?> getEmployeeInfo(@PathVariable String empName){
        log.info("empName {}",empName);
        List<EmployeeDetailResponseDTO> employees = employeesService.searchEmployeesByName(empName);

        List<EmployeeInfoResponseDTO> employeeInfoList = employees.stream()
                .map(employee -> {
                    EmployeeInfoResponseDTO employeeInfo = new EmployeeInfoResponseDTO();
                    employeeInfo.setEmpNo(employee.getEmpNo());
                    employeeInfo.setEmpName(employee.getEmpName());
                    employeeInfo.setEmpEmail(employee.getEmpEmail());
                    employeeInfo.setDeptName(employee.getDeptName());
                    employeeInfo.setPosName(employee.getPosName());
                    log.info("employeeInfo {}",employeeInfo);
                    return employeeInfo;
                })
                .collect(Collectors.toList());
        return ResponseEntity.ok().body(employeeInfoList);
    }

}
