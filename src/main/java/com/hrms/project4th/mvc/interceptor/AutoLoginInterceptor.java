//package com.hrms.project4th.mvc.interceptor;
//
//import com.hrms.project4th.mvc.entity.Employees;
//import com.hrms.project4th.mvc.repository.EmployeesMapper;
//import com.hrms.project4th.mvc.service.LoginService;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.util.WebUtils;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.time.LocalDateTime;
//
//import static com.hrms.project4th.mvc.util.LoginUtil.AUTO_LOGIN_COOKIE;
//
//@Configuration
//public class AutoLoginInterceptor implements HandlerInterceptor {
//
//    private EmployeesMapper employeesMapper;
//    private LoginService loginService;
//
//
//
//    public boolean preHandle(HttpServletRequest request,
//                             HttpServletResponse response,
//                             Object handler){
//
//        //1. 자동로그인 쿠키를 탐색
//        Cookie[] cookies = request.getCookies();
//        // 우리 대신 util이 반복문을 돌려준다
//        Cookie cookie = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);
//
//        if(cookie != null){
//            // 2. 쿠키에 저장된 세션 아이디를 읽는다.
//            String sessionId = cookie.getValue();
//
//            // 3. DB에서 세션 id로 회원 정보를 조회한다.
//            Employees foundEmployee = employeesMapper.findEmployee(sessionId);
//
//            // 4. 회원이 조회가 되었고 자동로그인 만료일 이전이라면
//            if (foundEmployee != null && LocalDateTime.now().isBefore(foundEmployee.getCookieLimitTime())) {
//
//                // 5. 로그인 처리
//                loginService.maintainLoginState(request.getSession(), foundEmployee.getEmpEmail());
//
//            }
//
//        }
//        return true;
//
//    }
//}
