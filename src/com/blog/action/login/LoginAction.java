package com.blog.action.login;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.blog.BaseAction;
import com.blog.entity.Manager;
import com.blog.service.ManagerService;

@Controller
public class LoginAction extends BaseAction{
	@Resource ManagerService managerServiceImpl;
	
	private String account;
	private String password;
	private String imageCode;
	private String errorMsg;
	private String pwdError;
	private Manager manager;
	
	public String account(){
		//使用account接收command
		if(managerServiceImpl.quertyByCommand(account)){
			account="true";
			session.put("manager", new Manager());
		}
		else
			account="false";
			return new Throwable().getStackTrace()[0].getMethodName();
	}
	public String execute(){
		errorMsg = null;
		pwdError = null;
		String code = (String)session.get("imageCode");
		if(imageCode != null&& imageCode.equalsIgnoreCase(code)){
		} else  if(session.get("admin")!=null){
			return "success";
		}else{
			errorMsg = "验证码错误";
			return "fail";
			
		}
		
		Manager manager = managerServiceImpl.querty(account);
		if(manager==null){
			pwdError = "用户名或密码错误";
			return "fail";
		}
		if(password.trim().equals(manager.getPassword())){
			session.put("manager", manager);
			return "success";
		}else{
			return "fail";
		}
		
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getPwdError() {
		return pwdError;
	}
	public void setPwdError(String pwdError) {
		this.pwdError = pwdError;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	
}
