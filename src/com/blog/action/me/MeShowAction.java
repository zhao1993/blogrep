package com.blog.action.me;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.email.SendEmail;
import com.blog.entity.Me;
import com.blog.service.MeService;

@Controller
public class MeShowAction {
	@Resource MeService meServiceImpl;
	private String msg;
	private String contact;
	private Me me;
	public String execute(){
		me = meServiceImpl.query(1);
		return "success";
	}
	public String suggest() throws Exception{
		if(msg!=null)
		new SendEmail().sendEMail(msg, contact);
		msg=null;
		return "success";
	}
	public Me getMe() {
		return me;
	}
	public void setMe(Me me) {
		this.me = me;
	}
	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	/**
	 * @return the contact
	 */
	public String getContact() {
		return contact;
	}
	/**
	 * @param contact the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	
}
