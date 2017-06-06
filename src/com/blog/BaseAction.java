package com.blog;

import java.util.Map;

import javax.servlet.ServletContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import com.blog.entity.Connect;

public class BaseAction implements SessionAware,ServletContextAware{
	
	protected Map<String, Object> session;
	protected ServletContext servletContext;
	protected Connect connect;
	protected String information;
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
		
	}
	/**
	 * @param state
	 */
	public void setServletContext(ServletContext arg0) {
		servletContext = arg0;
		
	}
	public Connect getConnect() {
		return connect;
	}
	public void setConnect(Connect connect) {
		this.connect = connect;
	}
	/**
	 * @return the information
	 */
	public String getInformation() {
		return information;
	}
	/**
	 * @param information the information to set
	 */
	public void setInformation(String information) {
		this.information = information;
	}
	
}
