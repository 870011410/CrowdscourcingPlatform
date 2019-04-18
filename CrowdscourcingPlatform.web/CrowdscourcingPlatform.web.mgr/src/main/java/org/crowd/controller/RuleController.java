package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.dto.RuleCenter;
import org.crowd.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * <p>Title : RuleController</p>
 * <p>Description :规则中心的Controller </p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Win10 x64 </p>
 * <p>Company : org.Lw</p>
 * @author : Lw
 * @date : 2018年12月9日 上午4:42:12
 * @version : 12.0.0
 */

@Controller
public class RuleController {
	@Autowired
	RuleService ruleService;//规则中心的事务接口
	
	//新增规则
	@RequestMapping("/do-createRule.action")
	@ResponseBody
	public JSONObject createRule(Integer rteId,String content,Integer score,Integer state,HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		Integer index=0;
		try {
			index=ruleService.createRule(rteId, content, score, state,admName);
		} catch (Exception e) {
			index=0;
		}
	    data.put("index", index);
	    return data;
	}
	
	//删除规则
	@RequestMapping("/do-deleteRule.action")
	@ResponseBody
	public JSONObject deleteRule(Integer id,HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		Integer index=0;
		try {
			index=ruleService.deleteRule(id,admName);
		} catch (Exception e) {
			index=0;
		}
	    data.put("index", index);
	    return data;
	}
	
	
	//修改规则
	@RequestMapping("/do-modifyRule.action")
	@ResponseBody
	public JSONObject modifyRule(Integer id,Integer rteId,String content,Integer score,Integer state,HttpServletRequest request) {
		
		System.out.println("rte-id:"+rteId);
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		
		Integer index=0;
		try {
			index=ruleService.modifyRule(id, rteId, content, score, state, admName);
		} catch (Exception e) {
			index=0;
		}
	    data.put("index", index);
	    return data;
	}
	
	//分页查询规则信息
	@RequestMapping("/do-searchRuleInfo.action")
	@ResponseBody
	public JSONObject searchRuleInfo(Integer rteId,Integer state,String content,Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		
		System.err.println("类型ID："+rteId+"状态："+state+"内容："+content);
		
		JSONObject data = new JSONObject();
		Integer count =ruleService.searchRuleCount(rteId, state, content);
		List<RuleCenter> ruleList = ruleService.searchRuleInfo(rteId, state, content, rb);
		if(ruleList==null) {
			System.err.println("是空的集合");
		}else {
			System.err.println("集合长度："+ruleList.size());
		}
		// 用json
		data.put("ruleList", ruleList );
		data.put("count", count);
		return data;
	}
	
	//规则的发布&取消
	@RequestMapping("/do-changeRuleState.action")
	@ResponseBody
	public JSONObject changeRuleState(Integer state,Integer id,HttpServletRequest request) {
		
		System.out.println("id:"+id);
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		Integer index=0;
		try {
			index=ruleService.changeRuleState(state, id, admName);
		} catch (Exception e) {
			index=0;
		}
	    data.put("index", index);
	    return data;
	}
	
}
