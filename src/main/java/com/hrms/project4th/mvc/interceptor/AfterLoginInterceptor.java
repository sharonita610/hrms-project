package com.hrms.project4th.mvc.interceptor;

import com.hrms.project4th.mvc.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Configuration
@RequiredArgsConstructor
@Slf4j

public class AfterLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws IOException {
        HttpSession session = request.getSession();

        if(!LoginUtil.isLogin(request.getSession())){
            log.info("this request ( {} ) denied!!", request.getRequestURI());
            response.sendRedirect("/");
            return false;
        }
        if (request.getRequestURI().startsWith("/hrms")) {
            response.sendRedirect("/");
            return false;
        }

        return true;
    }

}
