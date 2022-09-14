package com.project.foodiefoodie.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "com.project.foodiefoodie")
public class DataBaseConfig {


    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();

        config.setJdbcUrl("jdbc:mariadb://database-1.ce2n3tdihqpa.ap-northeast-2.rds.amazonaws.com:3306/TEAM_B");
        config.setDriverClassName("org.mariadb.jdbc.Driver");
        // 동진 루트계정
//        config.setUsername("admin");
//        config.setPassword("Ehdwls12!");
        // 기원계정
        config.setUsername("ki-won");
        config.setPassword("1234");

//        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
//        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");

        return new HikariDataSource(config);
    }
}
