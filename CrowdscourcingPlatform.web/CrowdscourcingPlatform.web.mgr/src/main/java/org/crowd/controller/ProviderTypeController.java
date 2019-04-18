package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.Admin;
import org.crowd.model.ProviderType;
import org.crowd.service.ProviderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ProviderTypeController {
	@Autowired
	ProviderTypeService providerTypeService;// 服务商类型配置的事务接口
	
	//从数据库中查处已经配置的服务商类型
	@RequestMapping("selectProviderType.action")
	@ResponseBody
	public JSONObject selectProviderType() {
		
		JSONObject data = new JSONObject();
		List<ProviderType> providerTypes = providerTypeService.selectProviderType();
	    data.put("providerTypes", providerTypes);
	    return data;
	}
	
	//新增服务商类型
	@RequestMapping("addProviderType.action")
	@ResponseBody
	public JSONObject addProviderType(String name,HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		if (name.equals("")) {
			data.put("type", "新增名称不能为空！");
			return data;
		}
		int index = 0;
		try {
			index = providerTypeService.addProviderType(name, "新增了服务商类型",admName);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		}else {
			data.put("type", "服务商类型名称重复！");
		}
		return data;
	}

}
