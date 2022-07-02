package com.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * @author ：qinjinwei
 * @date ：Created in 2022/5/7 21:06
 * @description：
 * @modified By：
 * @version: $
 */
@SpringBootApplication
@EnableEurekaServer
public class EurekaService {
    public static void main(String[] args){
        SpringApplication.run(EurekaService.class,args);
    }
}
