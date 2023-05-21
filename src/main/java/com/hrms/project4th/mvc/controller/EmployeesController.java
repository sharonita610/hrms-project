package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.dto.requestDTO.MyBossRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.GetMyBossResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.service.EmployeesService;
import com.hrms.project4th.mvc.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/hrms/employees")
public class EmployeesController {

    private final EmployeesService employeesService;

    @Value("${file.upload.root-path}")
    private String rootPath;

   //사원 전체리스트 페이지로 이동
    @GetMapping("/list")
    public String getEmployeesList() {
//        employeesService.getEmployeesList();
        return "admin/employeesList"; //관리자 사원 전체보기 jsp
    }

    //사원 전체 리스트 불러오기
    @GetMapping("/list/all")
    @ResponseBody
    public ResponseEntity<List<EmployeeDetailResponseDTO>> getEmployeesListAll() {
        return ResponseEntity.ok().body(employeesService.getDetailEmployeesList());
    }

    //부서별 사원 검색
    @GetMapping("/list/{deptCode}")
    @ResponseBody
    public ResponseEntity<List<EmployeeDetailResponseDTO>> getEmployeesListByDept(@PathVariable("deptCode") String deptCode) {
        log.info("deptCode : {}",deptCode);
        return ResponseEntity.ok().body(employeesService.getDetailEmployeesListByDept(deptCode));
    }

    //부서장 검색
    @GetMapping("/list/head")
    @ResponseBody
    public  ResponseEntity<List<EmployeeDetailResponseDTO>> getDeptHeadList() {
        return ResponseEntity.ok().body(employeesService.getDeptHeadList());
    }

    //사원추가 폼으로 이동
    @GetMapping("/add")
    public String addEmployee() {
        return "admin/addEmployee"; //jsp
    }

    //사원 추가 디비 반영
    @PostMapping("/add")
    public String addEmployee(AddEmployeesDTO dto) {
        String savePath = FileUtil.uploadFile(dto.getEmpPhone(), dto.getProfile(), rootPath);
        log.info(rootPath);
        employeesService.addEmployee(dto, savePath);
        return "redirect:/hrms/employees/add"; //전체사원 리스트로 리다이렉트
    }

    @GetMapping("/add/check")
    public ResponseEntity<Boolean> isDuplicated(String empEmail) {
        empEmail += "@samjosangsa.com";
        boolean flag = employeesService.isDuplicated(empEmail);
        return ResponseEntity.ok().body(flag);
    }

    //사원 상세정보 보기
//    @GetMapping("/detail/{empNo}")
//    public String getEmployeesDetail(@PathVariable("empNo") long empNo) {
//        return "admin/employeesDetail";
//    }

    //사원 수정 폼으로 이동
    @GetMapping("/modify/{empNo}")
    public String modifyEmployees(@PathVariable("empNo") long empNo, Model model) {
        EmployeeDetailResponseDTO dto = employeesService.getDetailedEmployee(empNo);
        model.addAttribute("emp", dto);
        return "admin/modifyEmployee";
    }

    //사원 수정 디비 반영
    @PostMapping("/modify")
    public String modifyEmployees(ModifyEmployeeDTO dto) {
        if (dto.getProfile().isEmpty()) {
            log.info("프로파일이 널입니다");
            employeesService.modifyEmployeesWithNoProfile(dto);
        } else {
            log.info("프로파일이 널이 아닙니다");
            String savePath = FileUtil.uploadFile(dto.getEmpPhone(), dto.getProfile(), rootPath);
            employeesService.modifyEmployees(dto, savePath);
        }
        return "admin/modifyEmployee"; //리스트로 리다이렉트로 변경 예정 !
    }

    //사원 삭제
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<Boolean> removeEmployee(long empNo) {
        boolean flag = employeesService.removeEmployee(empNo);
        return ResponseEntity.ok().body(flag);
    }

    @GetMapping("/boss/{dept}/{pos}")
    @ResponseBody
    public ResponseEntity<List> getDeptName(@PathVariable("dept") String dept, @PathVariable("pos") String pos) {
        log.info("controller : {}, {}", dept, pos);
        List<GetMyBossResponseDTO> bossNames = employeesService.getMyBossNames(
                MyBossRequestDTO.builder()
                        .deptCode(dept)
                        .posCode(pos)
                        .build());
        return ResponseEntity.ok().body(bossNames);
    }

//    // 사원 번호 수정하기
//    @PostMapping("/change-phone")
//    public ResponseEntity<String> updatePhoneNumber(@RequestBody Map<String, String> requestBody, HttpSession session) {
//        // Retrieve the new phone number from the request body
//        String newPhoneNumber = requestBody.get("phoneNumber");
//
//        // Retrieve the logged-in user from the session
//        Employees loggedInUser = (Employees) session.getAttribute("login");
//
//        // Check if the user is logged in and update the phone number
//        if (loggedInUser != null) {
//            loggedInUser.setEmpPhone(newPhoneNumber);
//            // You can save the updated user information in the database or perform any other necessary operations here
//
//            // Return a success response
//            return ResponseEntity.ok("Phone number updated successfully.");
//        }
//
//        // Return an error response if the user is not logged in
////        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in.");
////    }


}
