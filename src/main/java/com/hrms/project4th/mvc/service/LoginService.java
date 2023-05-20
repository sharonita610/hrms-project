package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.AutoLoginDTO;
import com.hrms.project4th.mvc.dto.requestDTO.LoginRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.LoginUserResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.LoginResult;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import com.hrms.project4th.mvc.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;

import static com.hrms.project4th.mvc.entity.LoginResult.*;
import static com.hrms.project4th.mvc.util.LoginUtil.AUTO_LOGIN_COOKIE;
import static com.hrms.project4th.mvc.util.LoginUtil.LOGIN_KEY;

@Slf4j
@Service
@RequiredArgsConstructor
public class LoginService {

    private final EmployeesMapper employeesMapper;
    // 비밀번호 암호화 하기 위한 코드
    // private final PasswordEncoder encoder;


    // 로그인 검증 처리하기
    public LoginResult authenticate(
            LoginRequestDTO dto,
            HttpSession session) {

        Employees foundEmployee = employeesMapper.findEmployee(dto.getEmpEmail());


        // 사원이 등록되어있는지 확인
        if (null == foundEmployee) {
            log.info("{} - 사원 등록이 되어있지 않습니다.", dto.getEmpEmail());
            return NO_EMP_EMAIL;
        }
        // 비밀번호 매칭 확인
        if (!(dto.getEmpPassword().matches(foundEmployee.getEmpPassword()))) {
            log.info("비밀번호 불일치합니다!");
            return WRONG_PW;
        }

        // 자동 로그인 체크 여부 확인, dto가 자동 로그인 처리 되어있다면
        if (dto.isAutoLogin()) {

            // 1. 세션에 로그인 상태를 저장
            session.setAttribute(LOGIN_KEY, true);

            // 2. 세션의 수명을 설정하기 (12시간)
            session.setMaxInactiveInterval(60 * 60 * 12);
        }

        log.info("{}님 로그인 성공!", employeesMapper.findEmployee(dto.getEmpEmail()));
        return SUCCESS;
    }


    public void maintainLoginState(HttpSession session, String empEmail) {

        // 현재 로그인한 사람의 모든 정보
        Employees employee = getMember(empEmail);

        // 현재 로그인한 사람의 화면에 보여줄 일부정보
        LoginUserResponseDTO dto = LoginUserResponseDTO.builder()
                .empNo(String.valueOf(employee.getEmpNo()))
                .empName(employee.getEmpName())
                .empPhone(employee.getEmpPhone())
                .empEmail(employee.getEmpEmail())
                .posCode(employee.getPosCode())
                .deptCode(employee.getDeptCode())
                .roleCode(employee.getRoleCode())
                .build();

        //  세션에 저장
        session.setAttribute(LOGIN_KEY, dto);

        // 세션의 수명을 설정
        session.setMaxInactiveInterval(60 * 60); // 1시간
    }



    //  멤버 정보를 가져오는 서비스 기능
    public Employees getMember(String empEmail) {

        return employeesMapper.findEmployee(empEmail);
    }


}

