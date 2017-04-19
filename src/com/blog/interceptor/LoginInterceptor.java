package com.blog.interceptor;


import java.util.Map;

import org.springframework.stereotype.Controller;

import com.blog.entity.Manager;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 监听器--监听用户是否登陆了
 * @author hao
 *
 */
@Controller
public class LoginInterceptor implements Interceptor {

	public void destroy() {
		
	}

	public void init() {
		
	}

	public String intercept(ActionInvocation ai) throws Exception {
		//1.取得session
		Map<String,Object> session = ai.getInvocationContext().getSession();
		//2.从session中取得登录信息
		Manager manager = (Manager) session.get("manager");
		//3.根据登录信息判断是否登录过
		if(manager == null) {
			return "login";
		} else {
			//调用Action
			return ai.invoke();
		}
	}

}
