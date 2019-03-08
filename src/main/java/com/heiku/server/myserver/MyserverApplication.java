package com.heiku.server.myserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MyserverApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyserverApplication.class, args);
    }

}
