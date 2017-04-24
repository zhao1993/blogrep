package com.blog.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	public static String getNowTime(){
		return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}
}
