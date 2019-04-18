package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.Rule;
import org.crowd.model.RuleType;
import org.crowd.model.User;
import org.crowd.model.dto.BrokeRuleDto;
import org.crowd.service.BrokeRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class BrokeRuleController {

	@Autowired
	BrokeRuleService brokeRuleService;// 曝光台配置的事务接口
	// ----------------------------------------------------------曝光台配置界面数据

	@RequestMapping("/initBrokeRule.action")
	@ResponseBody
	public JSONObject initBrokeRule(String begin, String end, String name, String state, String rule, Integer start,
			Integer limit) {

		RowBounds rb = new RowBounds(start, limit);
		// 状态ID
		Integer state_num = null;
		// 规则类型ID
		Integer rule_num = null;
		if (!state.equals("")) {
			state_num = Integer.parseInt(state);
		}
		if (!rule.equals("")) {
			rule_num = Integer.parseInt(rule);
		}
		List<BrokeRuleDto> brokeRuleDtos = brokeRuleService.initBrokeRule(begin, end, name, state_num, rule_num, rb);
		Integer count = brokeRuleService.initBrokeRuleCount(begin, end, name, state_num, rule_num);
		JSONObject data = new JSONObject();
		data.put("brokeRuleDtos", brokeRuleDtos);
		data.put("count", count);
		return data;

	}

	// 获取规则类型下拉框数据
	@RequestMapping("selectRuleType.action")
	@ResponseBody
	public JSONObject selectRuleType() {

		JSONObject data = new JSONObject();
		List<RuleType> ruleTypes = brokeRuleService.selectRuleType();
		data.put("ruleTypes", ruleTypes);
		return data;
	}

	// 获取规则下拉框数据
	@RequestMapping("selectRule.action")
	@ResponseBody
	public JSONObject selectRule() {

		JSONObject data = new JSONObject();
		List<Rule> rules = brokeRuleService.selectRule();
		data.put("rules", rules);
		return data;
	}

	// 获取规则内容
	@RequestMapping("selectRuleContent.action")
	@ResponseBody
	public JSONObject selectRuleContent(Integer id) {

		JSONObject data = new JSONObject();
		List<Rule> rules = brokeRuleService.selectRuleContent(id);
		data.put("rules", rules);
		return data;
	}

	// 曝光台发布内容修改
	@RequestMapping("updateBrokeRule.action")
	@ResponseBody
	public JSONObject updateBrokeRule(String ruleId, Integer brokeRule_id,HttpServletRequest request) {

		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		
		if (ruleId.equals("")) {
			data.put("type", "规则编号不能为空！");
			return data;
		}
		int index = 0;
		try {
			index = brokeRuleService.updateBrokeRule(Integer.parseInt(ruleId), brokeRule_id, "修改了曝光台内容", admName);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		}
		return data;
	}

	// 曝光台违规记录删除
	@RequestMapping("delBrokeRule.action")
	@ResponseBody
	public JSONObject delBrokeRule(String name, Integer brokeRule_id,HttpServletRequest request) {

		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		int index = 0;
		try {
			index = brokeRuleService.delBrokeRule(brokeRule_id, "删除了" + name + "的违规记录", admName);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		}
		return data;
	}

	// 曝光台违规记录置顶
	@RequestMapping("stickBrokeRule.action")
	@ResponseBody
	public JSONObject stickBrokeRule(String name, Integer brokeRule_id, Integer brokeRule_rank,HttpServletRequest request) {

		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		int index = 0;
		try {
			index = brokeRuleService.stickBrokeRule(brokeRule_id, brokeRule_rank, "置顶了" + name + "的违规记录",admName);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		} else {
			data.put("type", "已经是第一个了！");
		}
		return data;
	}

	// 曝光台违规记录上线
	@RequestMapping("upOrDownBrokeRule.action")
	@ResponseBody
	public JSONObject upOrDownBrokeRule(String name, Integer brokeRule_id, Integer state, String stateName,HttpServletRequest request) {

		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		int index = 0;
		try {
			index = brokeRuleService.upOrDownBrokeRule(brokeRule_id, state, stateName + "了" + name + "的违规记录", admName);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		}
		return data;
	}

	// 获取所有用户下拉框数据
	@RequestMapping("selectUser.action")
	@ResponseBody
	public JSONObject selectUser() {

		JSONObject data = new JSONObject();
		List<User> users = brokeRuleService.selectUser();
		data.put("users", users);
		return data;
	}

	//规则类型ID查规则ID
	@RequestMapping("selectRuleId.action")
	@ResponseBody
	public JSONObject selectRuleId(Integer id) {

		JSONObject data = new JSONObject();
		List<Rule> rules = brokeRuleService.selectRuleId(id);
		data.put("rules", rules);
		return data;
	}
	
	// 曝光台违规记录发布
	@RequestMapping("createBrokeRule.action")
	@ResponseBody
	public JSONObject createBrokeRule(String userName, Integer ruleId, Integer userId,HttpServletRequest request) {

		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		System.err.println("管理员名字："+admName);
		int index = 0;
		try {
			index = brokeRuleService.createBrokeRule(ruleId, userId,  "发布了" + userName + "的违规记录", admName);

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		}


		return data;
	}

}
