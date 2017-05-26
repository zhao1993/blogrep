package com.blog.action.user;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.blog.BaseAction;
import com.blog.entity.Manager;
import com.blog.entity.User;
import com.blog.service.UserService;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction{
	@Resource
	private UserService userServiceImpl; 
	private User user;
	private int exist;
	private String contactway;
	private String imageCode;
	private String errorMsg;
	public String Register () throws Exception{
		errorMsg = null;
		String code = (String)session.get("imageCode");
		if(imageCode != null && imageCode.equalsIgnoreCase(code)){
			user.setCreatedate(new Date(new java.util.Date().getTime()));
			user.setContact(contactway+":"+user.getContact());
			userServiceImpl.save(user);
			return "success";
		}else{
			errorMsg = "验证码错误";
			return "fail";
		}
	}
	public String userMsg () throws Exception{
		user = userServiceImpl.query(user.getId());
		user.setCritiques(null);
		return "success";
	}
	//验证账号和用户名是否存在
	public String userValidate() throws Exception{
		if(null!=user.getAccount() && userServiceImpl.accExist(user.getAccount()))
			exist = 1;
		else if(null!=user.getName() && userServiceImpl.nameExist(new String(user.getName().getBytes("ISO-8859-1"),"UTF-8")))
			exist = 2;
		else 
			exist = 0;
		return "success";
	}
	public String Login() throws Exception{
		User userl = userServiceImpl.query(user.getAccount());
		if(userl.getPassword().equals(user.getPassword())){
			ActionContext.getContext().getSession().put("loginUser", userl);
		}
		return "success";
	}
	public String LoginOut() throws Exception{
		if(null!=ActionContext.getContext().getSession().get("loginUser"))
			ActionContext.getContext().getSession().remove("loginUser");
		return "success";
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public int getExist() {
		return exist;
	}
	public void setExist(int exist) {
		this.exist = exist;
	}
	
	public String getContactway() {
		return contactway;
	}
	public void setContactway(String contactway) {
		this.contactway = contactway;
	}
	
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	
}
