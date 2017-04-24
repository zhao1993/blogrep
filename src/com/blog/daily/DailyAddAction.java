package com.blog.daily;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Daily;
import com.blog.service.DailyService;
import com.blog.util.TimeUtil;

@Controller
public class DailyAddAction{
	@Resource DailyService dailyServiceImpl;
	private Daily daily;
	public String execute() throws Exception{
		daily.setTime(TimeUtil.getNowTime());
		daily.setDescription("default");
		dailyServiceImpl.save(daily);
		daily = null;
		return "success";
	}
	public Daily getDaily() {
		return daily;
	}
	public void setDaily(Daily daily) {
		this.daily = daily;
	}
	
}
