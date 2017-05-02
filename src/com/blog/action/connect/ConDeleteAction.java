package com.blog.action.connect;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.blog.entity.Connect;
import com.blog.service.ConService;

@Controller
public class ConDeleteAction {
	@Resource ConService conServiceImpl;
	private Connect connect;
	private boolean result;
	public String execute() throws Exception{
		if(null!=connect && connect.getId()!=null)
			try{
		conServiceImpl.delete(connect.getId());
		connect = null;
		result = true;
		}
		catch(Exception e){
			result =false;
		}
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

