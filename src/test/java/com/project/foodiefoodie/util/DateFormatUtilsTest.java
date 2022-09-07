package com.project.foodiefoodie.util;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class DateFormatUtilsTest {


    @Test
    @DisplayName(" 시간이 포맷 ")
    void formatTimeVer1Test()
    {
        String s = DateFormatUtils.formatTimeVer1(new Date());
        System.out.println(s);
    }
}