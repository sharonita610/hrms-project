package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.service.EmployeesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/employees")
public class EmployeesController {

    private final EmployeesService employeesService;


    //사원 전체리스트 불러오기
    @GetMapping("/admin/list")
    public String getEmployeesList(){
        employeesService.getEmployeesList();
        return ""; //관리자 사원 전체보기 jsp
    }

    //사원추가 폼으로 이동
    @GetMapping("/admin/add")
    public String addEmployee(){
        return ""; //jsp
    }

    //사원 추가 디비 반영
    @PostMapping("/admin/add")
    public String addEmployee(AddEmployeesDTO dto){
        employeesService.addEmployee(dto);
        return ""; //전체사원 리스트로 리다이렉트
    }

    //사원 수정 폼으로 이동
    @GetMapping("/modify")
    public String modifyEmployees(long empNo){
        return "";
    }

    //사원 수정 디비 반영
    @PostMapping("/modify")
    public String modifyEmployees(ModifyEmployeeDTO dto){
        employeesService.modifyEmployees(dto);
        return ""; //리스트로 리다이렉트
    }

    //사원 삭제
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<Boolean> removeEmployee(long empNo){
        boolean flag = employeesService.removeEmployee(empNo);
        return ResponseEntity.ok().body(flag);
    }

}
