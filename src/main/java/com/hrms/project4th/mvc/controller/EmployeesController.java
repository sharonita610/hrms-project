package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.dto.requestDTO.MyBossRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.GetMyBossResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.service.EmployeesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/employees")
public class EmployeesController {

    private final EmployeesService employeesService;


    //사원 전체리스트 불러오기
    @GetMapping("/list")
    public String getEmployeesList(){
        employeesService.getEmployeesList();
        return ""; //관리자 사원 전체보기 jsp
    }

    //사원추가 폼으로 이동
    @GetMapping("/add")
    public String addEmployee(){
        return "admin/addEmployee"; //jsp
    }

    //사원 추가 디비 반영
    @PostMapping("/add")
    public String addEmployee(AddEmployeesDTO dto){
        employeesService.addEmployee(dto);
        return ""; //전체사원 리스트로 리다이렉트
    }

    @GetMapping("/add/check")
    public ResponseEntity<Boolean> isDuplicated(String empEmail){
        // 김혜영이 잠시 주석 처리함
//        empEmail += "@samjosangsa.com";
        boolean flag = employeesService.isDuplicated(empEmail);
        return ResponseEntity.ok().body(flag);
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

    @GetMapping("/boss/{dept}/{pos}")
    @ResponseBody
    public ResponseEntity<List> getDeptName(@PathVariable("dept") String dept, @PathVariable("pos") String pos){
        log.info("controller : {}, {}", dept, pos);
        List<GetMyBossResponseDTO> bossNames = employeesService.getMyBossNames(
                MyBossRequestDTO.builder()
                        .deptCode(dept)
                        .posCode(pos)
                        .build());
        return ResponseEntity.ok().body(bossNames);
    }

    // 사원 번호 수정하기
    @PostMapping("/change-phone")
    public ResponseEntity<String> updatePhoneNumber(@RequestBody Map<String, String> requestBody, HttpSession session) {
        // Retrieve the new phone number from the request body
        String newPhoneNumber = requestBody.get("phoneNumber");

        // Retrieve the logged-in user from the session
        Employees loggedInUser = (Employees) session.getAttribute("login");

        // Check if the user is logged in and update the phone number
        if (loggedInUser != null) {
            loggedInUser.setEmpPhone(newPhoneNumber);
            // You can save the updated user information in the database or perform any other necessary operations here

            // Return a success response
            return ResponseEntity.ok("Phone number updated successfully.");
        }

        // Return an error response if the user is not logged in
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in.");
    }



}
