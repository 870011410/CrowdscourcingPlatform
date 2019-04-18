package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.crowd.model.User;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;
import org.crowd.service.ShowWorkService;
import org.crowd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

@Controller
public class ShowWorkController {

	// 显示作品的事务
	@Autowired
	private ShowWorkService showtWorkServ;
	@Autowired
	private UserService userService;

	// 显示作品信息到界面上
	@RequestMapping("initShowWork.action")
	@ResponseBody
	public JSONObject initShowWork(Integer start, Integer limit, String title,Integer servId,Integer typeId) {

		JSONObject data = showtWorkServ.selectWorkMeg(servId, start, limit, title, typeId);
		return data;
		
	}

	// 将作品id保存到session中

	@RequestMapping("saveWorkIdToSession.action")
	@ResponseBody
	public JSONObject saveWorkIdToSession(Integer workId, HttpServletRequest request) {

		JSONObject data = new JSONObject();
		// 把needId存入session
		request.getSession().setAttribute("workIdShow", workId);

		return data;
	}

	// 查看某个作品id的详细需求信息
	@RequestMapping("selectWorkDetiWithWorkId.action")
	@ResponseBody
	public JSONObject selectWorkDetiWithWorkId(HttpServletRequest request) {

		JSONObject data = new JSONObject();
		// 拿到需求id
		Integer workId = (Integer) request.getSession().getAttribute("workIdShow");

		WorkDto workDto = showtWorkServ.selectWorkMegWithWorkId(workId);
		data.put("workDto", workDto);
		return data;
	}

	// 购买作品
	@RequestMapping("buyWork.action")
	@ResponseBody
	public JSONObject buyWork(HttpServletRequest request, Integer workId, String userName, String workTitle,
			Double workMoney, Integer workState) {
		JSONObject data = new JSONObject();
		
		User user = (User) request.getSession().getAttribute("user");
		// 没登入
		if (user == null) {

			data.put("res", "NotLogin");
			return data;
		}
		// 是自己的作品
		if (user.getName().equals(userName)) {
			data.put("res", "IsMyself");
			return data;
		}
		if (workState != 1) {
			data.put("res", "noUp");
			return data;
		}
		// 判断余额
		if (user.getMoney() < workMoney) {
			data.put("res", "noMoney");
			return data;
		}
		
		int index = 0;
		try {

			index = showtWorkServ.buyWork(workId,user.getId(), userName, workTitle, workMoney, user.getName());
			
			// 存到session
			HttpSession session = request.getSession();
			session.setAttribute("user", userService.afterUpdate(user.getId()));

		} catch (Exception e) {
			data.put("res", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("res", "SUC");
		}
		return data;
	}

}
