package com.blog.action.connect;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.blog.entity.Connect;
import com.blog.service.ConService;

@Controller
public class ConAddAction {
	@Resource ConService conServiceImpl;
	private Connect connect;
	public String execute() throws Exception{
		if(null!=connect)
		conServiceImpl.save(connect);
		connect = null;
		return "success";
	}
	public Connect getConnect() {
		return connect;
	}
	public void setConnect(Connect connect) {
		this.connect = connect;
	}
	
}