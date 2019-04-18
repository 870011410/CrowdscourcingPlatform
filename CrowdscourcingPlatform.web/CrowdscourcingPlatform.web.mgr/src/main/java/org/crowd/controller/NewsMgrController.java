package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.News;
import org.crowd.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class NewsMgrController {
	@Autowired
	private NewsService newsService;
	
	// 显示所有行业动态
	@RequestMapping("/do-showNews.action")
	@ResponseBody
	public JSONObject searchNewsInfo(String name,Integer state,String startTime,String endTime,Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		JSONObject data = new JSONObject();
		int count = newsService.searchNewsCount(name, state, startTime, endTime);
		List<News> newsList = newsService.searchNewsInfo(name, state, startTime, endTime, rb);
		// 用json
		data.put("newsList", newsList);
		data.put("count", count);
		return data;
	}
	
	//新增一条行业资讯
	@RequestMapping("/do-createNews.action")
	@ResponseBody
	public JSONObject createNews(String name,String link,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			newsService.createNews(name, link, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//删除一条行业资讯
	@RequestMapping("/do-delNews.action")
	@ResponseBody
	public JSONObject deleteNews(Integer id,String name,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			newsService.deleteNews(id, name, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//修改一条行业资讯
	@RequestMapping("/do-updateNews.action")
	@ResponseBody
	public JSONObject modifyNews(Integer id,String name,String link,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			newsService.modifyNews(id, name, link, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//上线一条行业资讯
	@RequestMapping("/do-onlineNews.action")
	@ResponseBody
	public JSONObject onlineNews(Integer id,String name,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			newsService.onlineNews(id, name, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//下线一条行业资讯
	@RequestMapping("/do-offlineNews.action")
	@ResponseBody
	public JSONObject offlineNews(Integer id,String name,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			newsService.offlineNews(id, name, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
}
