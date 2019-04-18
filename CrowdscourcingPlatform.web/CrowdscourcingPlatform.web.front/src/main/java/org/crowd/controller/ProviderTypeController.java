package org.crowd.controller;

import java.util.List;

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

	// 从数据库中查处已经配置的服务商类型
	@RequestMapping("selectProviderType.action")
	@ResponseBody
	public JSONObject selectProviderType() {

		JSONObject data = new JSONObject();
		List<ProviderType> providerTypes = providerTypeService.selectProviderType();
		data.put("providerTypes", providerTypes);
		return data;
	}

}
