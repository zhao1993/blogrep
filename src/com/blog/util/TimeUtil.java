package com.blog.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	public static String getNowTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(new Date());
		
	}
}
