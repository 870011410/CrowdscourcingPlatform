package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.Linker;
import org.crowd.model.Story;
import org.crowd.model.Trends;
import org.crowd.service.LinkerService;
import org.crowd.service.StoryService;
import org.crowd.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * <p>Title : LinkerController</p>
 * <p>Description :友情链接配置的Controller</p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Windows10</p>
 * <p>Company : org.wf</p> 
 * @author : WuFan
 * @date : 2018年12月8日 下午3:45:24
 * @version : 12.0.0
 */

@Controller
public class LinkerController {

	@Autowired
	private LinkerService ls;

	private JSONObject outJson = new JSONObject();

	// 显示所有友情链接
	@RequestMapping("/do-showLinkers.action")
	@ResponseBody
	public JSONObject doShowLinkers(String check_time_from, String check_time_to, String check_name,
			Integer check_state, Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = ls.countAllLinkers(check_name, check_time_from, check_time_to, check_state);
		List<Linker> linkers = ls.showAllLinkers(rb, check_name, check_time_from, check_time_to, check_state);
		// 用json
		outJson.put("linkers", linkers);
		outJson.put("count", count);
		return outJson;
	}

	// 发布友情链接
	@RequestMapping("/do-createLinker.action")
	@ResponseBody
	public JSONObject doCreateLinker(String name, String link,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		// 查看该链接名是否已存在
		int i = ls.checkLinkerName(name);
		if (i > 0) {
			// 链接名重复不能发布
			outJson.put("type", "nameExist");
			return outJson;
		}

		try {
			ls.createLinker(name, link, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 修改友情链接
	@RequestMapping("/do-updateLinker.action")
	@ResponseBody
	public JSONObject doUpdateLinker(Integer select_id, String name,HttpServletRequest request, String link) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		// 判断标题是否重复
		int i = ls.checkUpdateName(select_id, admName);
		if (i > 0) {
			// 用json
			outJson.put("type", "nameExist");
			return outJson;
		}
		try {
			ls.updateLinker(select_id, name, link, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 删除友情链接
	@RequestMapping("/do-delLinker.action")
	@ResponseBody
	public JSONObject doDelLinker(Integer select_id, String select_name,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ls.delLinker(select_id,select_name, admName);
			;
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 上线友情链接
	@RequestMapping("/do-uplineLinker.action")
	@ResponseBody
	public JSONObject doUplineLinker(Integer select_id, String select_name,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ls.uplineLinker(select_id, select_name,admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 下线友情链接
	@RequestMapping("/do-downlineLinker.action")
	@ResponseBody
	public JSONObject doDownlineLinker(Integer select_id, String select_name,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ls.downlineLinker(select_id, select_name, admName);
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
