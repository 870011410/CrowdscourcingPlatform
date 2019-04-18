package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.User;
import org.crowd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class UserController {
	@Autowired
	UserService userService;// 用户表的事务接口
	// ----------------------------------------------------------雇主管理界面数据分页

	@RequestMapping("/initUser.action")
	@ResponseBody
	public JSONObject initUser(String begin, String end, String name, Integer type, Integer start, Integer limit) {

		RowBounds rb = new RowBounds(start, limit);

		List<User> user = userService.initUser(name, begin, end, type, rb);
		Integer count = userService.initUserCount(name, begin, end, type);
		JSONObject data = new JSONObject();
		data.put("user", user);
		data.put("count", count);
		return data;
	}

	// ----------------------------------------------------------用户的锁定与恢复
	@RequestMapping("/motifyUserState.action")
	@ResponseBody
	public JSONObject motifyUserState(Integer userId, String uname, Integer state,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		String content = "修改了用户" + uname + "状态";

		int index1 = 0;
		try {
			index1 = userService.motifyState(userId, admName, state, content);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index1 == 1) {
			data.put("type", "SUC");
		}
		return data;
	}

	// ----------------------------------------------------------用户的密码重置
	@RequestMapping("/resetPwd.action")
	@ResponseBody
	public JSONObject resetPwd(Integer userId, String uname,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		String content = "重置了用户" + uname + "的密码";


		int index1 = 0;
		try {
			index1 = userService.resetPwd(userId, "111", admName, content);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index1 == 1) {
			data.put("type", "SUC");
		}
		return data;
	}
	//设置或取消顾问资格(zjw)
	@RequestMapping("canseOrSetAdv.action")
	@ResponseBody
	public JSONObject canseOrSetAdv(Integer type,Integer userId, HttpServletRequest request,String userName,String ctrl) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		Integer res = 0;
		try {
			res = userService.canseOrSetAdv(type, userId, userName, ctrl, admName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			res = 0;
		}
		if(res==0) {
			data.put("res","操作失败！");
		}else {
			data.put("res","操作成功！");
		}
		
		return data;
	}
}
