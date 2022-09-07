package com.project.foodiefoodie.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtils {

    public static String makeFewDaysAgo(Date date) {

        int SEC = 60;
        int MIN = 60;
        int HOUR = 24;
        int DAY = 30;
        int MONTH = 12;

        long curTime = System.currentTimeMillis();
        long regTime = date.getTime();
        long diffTime = (curTime - regTime) / 1000;

        System.out.println(regTime);
        System.out.println(diffTime);
        String ruesult = null;

        if (diffTime < SEC) {
            // sec
            ruesult = diffTime + "초 전";
        } else if ((diffTime /= SEC) < MIN) {
            // min
            ruesult = diffTime + "분 전";
        } else if ((diffTime /= MIN) < HOUR) {
            // hour
            ruesult = (diffTime) + "시간 전";
        } else if ((diffTime /= HOUR) < DAY) {
            // day
            ruesult = (diffTime) + "일 전";
        } else if ((diffTime /= DAY) < MONTH) {
            // day
            ruesult = (diffTime) + "달 전";
        } else {
            ruesult = (diffTime) + "년 전";
        }
        return ruesult;
    }

    public static boolean checkNewUpdate(Date date) {
        long curTime = System.currentTimeMillis();
        long regTime = date.getTime();
        long diffTime = (curTime - regTime) / 1000;
        return diffTime < 60*60*24*3;
    }

    public static String formatTimeVer1(Date date)
    {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a hh:mm ");
        return simpleDateFormat.format(date);
    }
}
