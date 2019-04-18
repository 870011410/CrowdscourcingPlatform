package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.dto.SucCase;
import org.crowd.service.SucCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class SucCaseController {
	//成功案例的service接口
	@Autowired
	private SucCaseService sucCaseService;
	
	
	//分页查询成功案例
	@RequestMapping("initSucCase.action")
	@ResponseBody
	public JSONObject initSucCase(String title,String content,Integer state,Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		JSONObject data = new JSONObject();
		
		System.err.println("标题："+title+",内容："+content+"，状态："+state);
		
		int count=sucCaseService.searchSucCaseCount(title, content, state);
		List<SucCase> caseList=sucCaseService.searchSucCaseInfo(rb, title, content, state);
		data.put("caseList", caseList);
		data.put("count", count);
		return data;
	}
	
	//查询账务表的ID（还未绑定成功案例）
	@RequestMapping("selectAccId.action")
	@ResponseBody
	public JSONObject searchAccId() {
		JSONObject data = new JSONObject();
		List<Integer> list=sucCaseService.searchAccId();
		data.put("list", list);
		return data;
	}
	
	//新增一条成功案例
	@RequestMapping("/do-createSucCase.action")
	@ResponseBody
	public JSONObject createSucCase(String title,String content,Integer sucAccId,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		System.err.println("标题："+title+"内容："+content+"案例编号："+sucAccId);
		try {
			sucCaseService.createSucCase(title, content, sucAccId, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//删除一条成功案例
	@RequestMapping("/do-delSucCase.action")
	@ResponseBody
	public JSONObject deleteSucCase(Integer id,String title,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			sucCaseService.deleteSucCase(id, title, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//修改一条成功案例
	@RequestMapping("/do-modifySucCase.action")
	@ResponseBody
	public JSONObject modifySucCase(Integer id,String title,String content,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		System.err.println("ID哦："+id+"，标题："+title+"，内容："+content);
		try {
			sucCaseService.modifySucCase(id, title, content, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//上线一条成功案例
	@RequestMapping("/do-onlineSucCase.action")
	@ResponseBody
	public JSONObject onlineSucCase(Integer id,String title,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			sucCaseService.onlineSucCase(id, title, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//下线一条成功案例
	@RequestMapping("/do-offlineSucCase.action")
	@ResponseBody
	public JSONObject offlineSucCase(Integer id,String title,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			sucCaseService.offlineSucCase(id, title, admName);
		} catch (Exception e) {
			// 用json
			data.put("type", "fail");
			return data;
		}
		// 用json
		data.put("type", "success");
		return data;
	}
	
	//置顶成功案例
	@RequestMapping("/do-stickSucCase.action")
	@ResponseBody
	public JSONObject stickSucCase(Integer id,String title,Integer rank,HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		System.err.println("这里是置顶,ID："+id+"，标题："+title+"，排序："+rank);
		try {
			int i = sucCaseService.stickSucCase(id, admName, title, rank);
			// 已经是第一个了
			if (i < 0) {
				// 用json
				data.put("type", "alredyStick");
				return data;
			}
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
