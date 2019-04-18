package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.Admin;
import org.crowd.model.NeedTypeModel;
import org.crowd.model.ServerTypeModel;
import org.crowd.model.dto.ServerType_picture;
import org.crowd.service.NeedTypeDeployService;
import org.crowd.service.ServerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 
     * <p>Title : NeedTypeDeployController</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月6日 下午3:14:29
     * @version : 12.0.0
 */
//需求类型配置的controller
@Controller
public class NeedTypeDeployController {

	//需求类型配置的事务
	@Autowired
	private NeedTypeDeployService needTypeServ;
	
	//服务类型的事务
	@Autowired
	private ServerTypeService servTypeServ;
	//从数据库中查处已经配置的需求类型
	@RequestMapping("selectNeedType.action")
	@ResponseBody
	public JSONObject selectNeedType() {
		
		JSONObject data = new JSONObject();
		List<NeedTypeModel> needTypes = needTypeServ.selectNeedType();
	    data.put("needTypes", needTypes);
	    return data;
	}
	
	//获取添加新需求类型界面的所有的服务类型
	
	@RequestMapping("selectServerType.action")
	@ResponseBody
	public JSONObject selectServerType() {
		
		JSONObject data = new JSONObject();
		List<ServerType_picture> serverTypes =servTypeServ.selectServerType();
	    data.put("serverTypes", serverTypes);
	    return data;
	}
	
	
	//添加一个新的需求类型
	@RequestMapping("addNewNeedType.action")
	@ResponseBody
	public JSONObject addNewNeedType(String needTypeName,Integer serverId,HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		Integer res =0;
		try {
			res= needTypeServ.addNewNeedType(needTypeName, serverId,admName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			res=0;
		}
	    data.put("res", res);
	    return data;
	}
}
