package org.crowd.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.crowd.model.Admin;
import org.crowd.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

//需求类型配置的controller
@Controller
public class AdminLoginController {

	private JSONObject LogJson = new JSONObject();
	// 需求类型配置的事物
	@Autowired
	private AdminLoginService adminLoginservice;

	// 从数据库中查处已经配置的需求类型
	@RequestMapping("adminLoginservice.action")
	@ResponseBody
	public JSONObject adminLogin(String acc,String pwd, HttpServletRequest req) {
		
		System.err.println(acc);
		System.err.println(pwd);
		Admin admin = null;
		try {
			admin = adminLoginservice.login(acc, pwd);
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LogJson.put("admin",admin);
		
		if(admin!=null) {
			LogJson.put("type","suc");
			
			// 存到session
			HttpSession session = req.getSession();
			session.setAttribute("admin", admin);			
	    	
		}else {
			LogJson.put("type", "fail");
		}
		System.out.println(LogJson);
		return LogJson;
 
	    
	}
	
	


}
