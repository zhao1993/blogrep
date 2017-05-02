package com.blog.action.connect;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.blog.entity.Connect;
import com.blog.service.ConService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class ConAddAction extends ActionSupport{
	@Resource ConService conServiceImpl;
	private Connect connect;
	public String execute() throws Exception{
		if(null!=connect){
		connect.setId(null);
		if(-1==connect.getTarget().indexOf("http://") && -1==connect.getTarget().indexOf("https://"))
			connect.setTarget("http://"+connect.getTarget());
		conServiceImpl.save(connect);
		}
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
