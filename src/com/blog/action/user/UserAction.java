package com.blog.action.user;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.blog.entity.User;
import com.blog.service.UserService;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class UserAction {
	@Resource
	private UserService userServiceImpl; 
	private User user;
	private boolean repetition;
	private String contactway;
	public String Register () throws Exception{
		user.setCreatedate(new Date(new java.util.Date().getTime()));
		user.setContact(contactway+":"+user.getContact());
		userServiceImpl.save(user);
		return "success";
	}
	public String userMsg () throws Exception{
		user = userServiceImpl.query(user.getId());
		return "success";
	}
	public String NameValidate() throws Exception{
		List<User> users =  userServiceImpl.getUsers();
		for (User userl : users) {
			if(userl.getName().equals(user.getName())){
				repetition = true;
				break;
			}
		}
		repetition = false;
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
	public boolean isRepetition() {
		return repetition;
	}
	public void setRepetition(boolean repetition) {
		this.repetition = repetition;
	}
	public String getContactway() {
		return contactway;
	}
	public void setContactway(String contactway) {
		this.contactway = contactway;
	}
	
}
