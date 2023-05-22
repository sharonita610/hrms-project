package com.hrms.project4th.mvc.config;

import com.hrms.project4th.mvc.interceptor.AfterLoginInterceptor;
import com.hrms.project4th.mvc.interceptor.AutoLoginInterceptor;
import com.hrms.project4th.mvc.interceptor.MainIntercetor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {


    // 인터셉터 설정하기
//    private final AfterLoginInterceptor afterLoginInterceptor;
    private final AutoLoginInterceptor autoLoginInterceptor;
    private final MainIntercetor mainIntercetor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 로그인 후처리 인터셉터 설정
        registry.addInterceptor(mainIntercetor)
                .addPathPatterns("/hrms/*")
                .excludePathPatterns("/hrms/main-page");

//        // 자동로그인 인터셉터 설정
//        registry.addInterceptor(autoLoginInterceptor)
//                .addPathPatterns("/**");

    }


}
