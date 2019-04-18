package org.crowd.controller;

import java.util.List;

import javax.imageio.metadata.IIOInvalidTreeException;
import javax.servlet.http.HttpServletRequest;

import org.crowd.model.Admin;
import org.crowd.model.NeedTypeModel;
import org.crowd.model.Picture;
import org.crowd.model.dto.ServerType_picture;
import org.crowd.service.ServerTypeService;
import org.crowd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ServerTypeController {
	@Autowired
	ServerTypeService serverTypeService;// 服务类型事务的接口

	// 获取所有的服务图标
	@RequestMapping("selectPicture.action")
	@ResponseBody
	public JSONObject selectPicture() {

		JSONObject data = new JSONObject();
		List<Picture> picture = serverTypeService.selectPicture();
		data.put("picture", picture);
		return data;
	}

	// 添加新的服务类型
	@RequestMapping("addServerType.action")
	@ResponseBody
	public JSONObject addServerType(String name,String id,HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		
		if(name.equals("")||id.equals("")) {
			data.put("type", "信息不完整！");
			return data;
		}
		
		Integer index=0;
		try {
			index=serverTypeService.addServerType(name, Integer.parseInt(id), admName, "添加了"+name+"服务类型");
		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if(index==1) {
			data.put("type", "SUC");
		}else {
			data.put("type", "服务类型名称重复");
		}
		return data;
	}
}
