package com.blog.action.connect;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.blog.entity.Connect;
import com.blog.service.ConService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class ConUpdateAction extends ActionSupport{
	@Resource ConService conServiceImpl;
	private Connect connect;
	private boolean result;
	public String execute() throws Exception{
		if(null!=connect)
		{
			if(-1==connect.getTarget().indexOf("http://") && -1==connect.getTarget().indexOf("https://"))
				connect.setTarget("http://"+connect.getTarget());
		conServiceImpl.update(connect);
		result = true;
		connect = null;}
		return "success";
	}
	public String updateBefore() throws Exception{
		connect = conServiceImpl.query(connect.getId());
		return "success";
	}
	public Connect getConnect() {
		return connect;
	}
	public void setConnect(Connect connect) {
		this.connect = connect;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	
}
