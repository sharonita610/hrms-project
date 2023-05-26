//package com.hrms.project4th.mvc;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//
//@Configuration
//public class LocalClubResourceConfig implements WebMvcConfigurer {
//
////    @Value("C:/hrms/employeesProfile/")
////    @Value("${clubFile.upload.root-path}")
//    @Value("${clubFile.upload.root-path}")
//    private  String clubRootPath;
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/hrms2/**")
//                .addResourceLocations("file:/" + clubRootPath)
//        ;
//
//    }
//}
