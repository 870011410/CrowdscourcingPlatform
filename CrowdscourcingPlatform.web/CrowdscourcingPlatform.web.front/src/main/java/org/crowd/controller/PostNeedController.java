package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.NeedTypeModel;
import org.crowd.model.User;
import org.crowd.service.PostNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : PostNeedController
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : macOS Sierra 10.12.1
 * </p>
 * <p>
 * Company : org.crowds
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月10日 上午8:40:28
 * @version : 12.0.0
 */
//发布需求的controller
@Controller
public class PostNeedController {

	// 发布需求的事务
	@Autowired
	private PostNeedService postNeedServ;

	// 从数据库中查处已经配置的需求类型(zjw)
	@RequestMapping("selectNeedType.action")
	@ResponseBody
	public JSONObject selectNeedType() {

		JSONObject data = new JSONObject();
		List<NeedTypeModel> needTypes = postNeedServ.selectNeedType();
		data.put("needTypes", needTypes);
		return data;
	}

	// 选择需求类型后跳转到添加需求界面（zjw）
	@RequestMapping("jumpAddNeedWithNeedType.action")
	@ResponseBody
	public JSONObject jumpAddNeedWithNeedType(String needTypeName, Integer needtypeId, HttpServletRequest request) {

		JSONObject data = new JSONObject();
		request.getSession().setAttribute("needTypeName", needTypeName);
		request.getSession().setAttribute("needtypeId", needtypeId);
		data.put("res", "ok");
		return data;
	}

	// 选择作品类型后跳转到添加作品界面（lzw）
	@RequestMapping("jumpUpWorksWithNeedType.action")
	@ResponseBody
	public JSONObject jumpUpWorksWithNeedType(String workTypeName, Integer worktypeId, HttpServletRequest request) {

		JSONObject data = new JSONObject();
		request.getSession().setAttribute("workTypeName", workTypeName);
		request.getSession().setAttribute("worktypeId", worktypeId);
		data.put("res", "ok");
		return data;
	}

	// 添加一个新的需求(zjw)
	@RequestMapping("addNewNeed.action")
	@ResponseBody
	public JSONObject addNewNeed(HttpServletRequest request, Integer needTypeId, String title, String content,
			String require, String weekDate, Double money, String endTime) {

		JSONObject data = new JSONObject();
		
		//较验参数
		if(needTypeId==null||title==null||content==null||require==null||weekDate==null||money==null||endTime==null) {
			data.put("res", "check");
			return data;
		}
		
		// 获取登入的用户
		User user = (User) request.getSession().getAttribute("user");
		// 添加一个新需求
		try {
			postNeedServ.addNewNeed(user.getName(), user.getId(), needTypeId, title, content, require, weekDate, money,
					endTime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			data.put("res", "no");
			return data;
		}
		data.put("res", "yes");

		return data;
	}
}
