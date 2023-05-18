package com.hrms.project4th.mvc;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class LocalResourceConfig implements WebMvcConfigurer {

    @Value("C:/hrms/employeesProfile/")
    private String rootPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/hrms/**")
                .addResourceLocations("file:" + rootPath);

    }
}
