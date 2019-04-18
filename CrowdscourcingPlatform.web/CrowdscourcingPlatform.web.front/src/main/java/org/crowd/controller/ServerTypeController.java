package org.crowd.controller;

import java.util.List;

import javax.imageio.metadata.IIOInvalidTreeException;
import javax.servlet.http.HttpServletRequest;

import org.crowd.model.NeedTypeModel;
import org.crowd.model.Picture;
import org.crowd.model.dto.ServerType_picture;
import org.crowd.service.ServerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ServerTypeController {
	@Autowired
	ServerTypeService serverTypeService;// 服务类型事务的接口

	// 获取所有的服务图标(主页)
	@RequestMapping("initServerType.action")
	@ResponseBody
	public JSONObject initServerType() {

		JSONObject data = new JSONObject();
		List<ServerType_picture> picture = serverTypeService.selectServerType();
		data.put("picture", picture);
		return data;
	}
	//选择某一个服务类型跳转
	@RequestMapping("choseServerInHomePage.action")
	@ResponseBody
	public JSONObject choseServerInHomePage(Integer serverTypeId,HttpServletRequest request) {

		JSONObject data = new JSONObject();
		//存session
		request.getSession().setAttribute("serverTypeId", serverTypeId);
		return data;
	}
}
