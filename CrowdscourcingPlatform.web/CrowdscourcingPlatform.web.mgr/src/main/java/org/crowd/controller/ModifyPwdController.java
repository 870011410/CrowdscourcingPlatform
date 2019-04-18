package org.crowd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.crowd.service.ModifyPwdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ModifyPwdController {

	private JSONObject modJson = new JSONObject();
	// 需求类型配置的事物
	@Autowired
	private ModifyPwdService modifyLogin;
	
	// 从数据库中查处已经配置的需求类型
		@RequestMapping("/modifyPwd.action")
		@ResponseBody
		public JSONObject modifyLogin(String acc,String pwd,HttpServletRequest req) {


			Integer index = null;
		
			try {
				index = modifyLogin.modifyPwd(acc,pwd);
				 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			modJson.put("modify",index);
			
			if(index>0) {
				modJson.put("type","suc");
				// 清空session
				HttpSession session = req.getSession();
				session.setAttribute("admin", null);		    	
			}
			System.out.println(modJson);
			return modJson;
	 
		    
		}
	
	

}
