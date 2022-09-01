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

//        config.setJdbcUrl("jdbc:mariadb://localhost:3306/teamB");
//        config.setDriverClassName("org.mariadb.jdbc.Driver");

        config.setUsername("teamB");
        config.setPassword("1234");
        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");

        return new HikariDataSource(config);
    }
}
