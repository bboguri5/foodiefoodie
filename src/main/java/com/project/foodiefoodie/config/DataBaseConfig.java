package com.project.foodiefoodie.config;

import com.google.api.client.util.Value;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "com.project.foodiefoodie")
@PropertySource("classpath:key.properties")
public class DataBaseConfig {

    @Value
    String key;

    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();

        config.setJdbcUrl("jdbc:mariadb://database-1.ce2n3tdihqpa.ap-northeast-2.rds.amazonaws.com:3306/TEAM_B");
        config.setDriverClassName("org.mariadb.jdbc.Driver");
        config.setUsername("jung-ah");
        config.setPassword("1234");
//        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
//        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");

        config.setMaximumPoolSize(1);

        return new HikariDataSource(config);
    }
}
