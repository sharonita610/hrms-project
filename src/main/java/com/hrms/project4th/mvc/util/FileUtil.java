package com.hrms.project4th.mvc.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class FileUtil {

    public static String uploadFile(
            String phoneNum, MultipartFile file, String path
    ){
        //원본파일명을 이메일 아이디로 변경
        String newFileName = phoneNum.substring(3, 7) + "_" + file.getOriginalFilename();

        //파일 저장할 폴더 날짜별로 생성
        String newPath = makeDirectory(path);

        //파일 업로드
        try {
            file.transferTo(new File(newPath, newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        //저장된 파일의 전체경로
        String fullPath =  newPath + newFileName;
        String responsePath = "/"+fullPath.substring(path.length());
        return responsePath;
    }

    public static String saveBoardFile(MultipartFile file, String path){

        //원본파일명을 이메일 아이디로 변경

        String newFileName
                = UUID.randomUUID() + "_" + file.getOriginalFilename();

        //파일 저장할 폴더 날짜별로 생성
        String newPath = makeDirectory(path);

        //파일 업로드
        try {
            file.transferTo(new File(newPath, newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        //저장된 파일의 전체경로
        String fullPath = newPath + newFileName;
        String responsePath = "/local"+fullPath.substring(path.length());
        return responsePath;

    }

    public static String uploadClubFile(Long empNo, MultipartFile file, String path) {
        // 원본 파일명 변경
        String newClubFileName = empNo + "_" + file.getOriginalFilename();

        // 날짜별 폴더 생성
        String newClubPath = makeDirectory(path);

        try {
            file.transferTo(new File(newClubPath, newClubFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return newClubPath + newClubFileName;
    }

    private static String makeDirectory(String path) {


        LocalDateTime now = LocalDateTime.now();
        int y = now.getYear();
        int m = now.getMonthValue();
        int d = now.getDayOfMonth();

        List<String> date = List.of(String.valueOf(y), len2(m), len2(d));

        String directory = path;

        for (String s : date) {
            directory += s + "/";
            File file = new File(directory);

            if(!file.exists()){
                file.mkdirs();
            }
        }
        return directory;
    }

    private static String len2(int d) {
        return new DecimalFormat("00").format(d);
    }
}
