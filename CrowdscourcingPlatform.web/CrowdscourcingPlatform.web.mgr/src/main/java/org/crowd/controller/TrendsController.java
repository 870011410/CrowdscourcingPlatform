package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.Trends;
import org.crowd.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * <p>Title : TrendsController</p>
 * <p>Description :行业动态的Controller</p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Windows10</p>
 * <p>Company : org.wf</p>
 * @author : WuFan
 * @date : 2018年12月7日 下午8:50:40 
 * @version : 12.0.0
 */

@Controller
public class TrendsController {

	@Autowired
	private TrendsService ts;

	private JSONObject outJson = new JSONObject();

	// 显示所有行业动态
	@RequestMapping("/do-showTrends.action")
	@ResponseBody
	public JSONObject doShowTrends(String check_time_from, String check_time_to, String check_name, Integer check_type,
			Integer check_state, Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = ts.countAllTrends(check_name, check_time_from, check_time_to, check_type, check_state);
		List<Trends> trends = ts.showAllTrends(rb, check_name, check_time_from, check_time_to, check_type, check_state);

		// 用json
		outJson.put("trends", trends);
		outJson.put("count", count);
		return outJson;
	}

	// 发布行业动态
	@RequestMapping("/do-createTrends.action")
	@ResponseBody
	public JSONObject doCreateTrends(String name, String link, Integer type,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		// 查看该动态名是否已存在
		int i = ts.checkTrendsName(name);
		if (i > 0) {
			// 动态名重复不能发布
			outJson.put("type", "nameExist");
			return outJson;
		}

		try {
			ts.createTrends(name, type, link, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 修改行业动态
	@RequestMapping("/do-updateTrends.action")
	@ResponseBody
	public JSONObject doUpdateTrends(Integer select_id, String name, HttpServletRequest request, String link, Integer type) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		// 判断标题是否重复
		int i = ts.checkUpdateName(select_id, name);
		if (i > 0) {
			// 用json
			outJson.put("type", "nameExist");
			return outJson;
		}
		try {
			ts.updateTrends(select_id, name, link, admName, type);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 删除行业动态
	@RequestMapping("/do-delTrends.action")
	@ResponseBody
	public JSONObject doDelTrends(Integer select_id, String select_name, HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ts.delTrends(select_id, select_name, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 上线动态
	@RequestMapping("/do-uplineTrends.action")
	@ResponseBody
	public JSONObject doUplineTrends(Integer select_id, String select_name,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ts.uplineTrends(select_id, select_name, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 下线行业动态
	@RequestMapping("/do-downlineTrends.action")
	@ResponseBody
	public JSONObject doDownlineTrends(Integer select_id, String select_name,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ts.downlineTrends(select_id, select_name, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	public JSONObject getOutJson() {
		return outJson;
	}

	public void setOutJson(JSONObject outJson) {
		this.outJson = outJson;
	}

}
