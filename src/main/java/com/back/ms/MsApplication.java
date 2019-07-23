package com.back.ms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@MapperScan("com.back.ms.mapper")
public class MsApplication extends SpringBootServletInitializer {


    public static void main(String[] args) {
        SpringApplication.run(MsApplication.class, args);
    }
}
