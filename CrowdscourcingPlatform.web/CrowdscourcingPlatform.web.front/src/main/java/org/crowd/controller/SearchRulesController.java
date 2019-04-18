package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.User;
import org.crowd.model.dto.RuleCenter;
import org.crowd.service.SearchRulesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class SearchRulesController {
	
	@Autowired
	private SearchRulesService searchRulesService;
	
	//查询需求发布规则	
	@RequestMapping("/do-showRulesAboutPostNeed.action")
	@ResponseBody
	public JSONObject showRulesAboutPostNeed(Integer ruleTypeId) {
		JSONObject data = new JSONObject();
		System.err.println("规则类型ID："+ruleTypeId);
		List<RuleCenter> ruleList=searchRulesService.searchRuleAboutPostNeed(ruleTypeId);
		data.put("ruleList", ruleList);
		System.err.println("规则集合长度："+ruleList.size());
		return data;
	}
	
	//查询投标规则	
	@RequestMapping("/do-showRulesAboutBid.action")
	@ResponseBody
	public JSONObject showRulesAboutBid() {
		JSONObject data = new JSONObject();
		List<RuleCenter> ruleList=searchRulesService.searchRuleAboutBid();
		data.put("ruleList", ruleList);
		return data;
	}
}
