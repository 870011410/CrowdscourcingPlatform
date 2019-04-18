package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.BrokeRuleMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.Rule;
import org.crowd.model.RuleType;
import org.crowd.model.User;
import org.crowd.model.dto.BrokeRuleDto;
import org.crowd.service.BrokeRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BrokeRuleServiceImpl implements BrokeRuleService {
	@Autowired
	private BrokeRuleMapper brokeRuleMapper;// 曝光台界面Dao
	@Autowired
	UserMapper userMapper;

	// 曝光台配置界面数据初始化
	@Override
	public List<BrokeRuleDto> initBrokeRule(String begin, String end, String name, Integer state, Integer rule,
			RowBounds rb) {
		List<BrokeRuleDto> brokeRuleDtos = brokeRuleMapper.initBrokeRule(begin, end, name, state, rule, rb);
		return brokeRuleDtos;
	}

	@Override
	public Integer initBrokeRuleCount(String begin, String end, String name, Integer state, Integer rule) {
		Integer count = brokeRuleMapper.initBrokeRuleCount(begin, end, name, state, rule);
		return count;
	}

	// 获取规则类型下拉框数据
	@Override
	public List<RuleType> selectRuleType() {
		List<RuleType> ruleTypes = brokeRuleMapper.selectRuleType();
		return ruleTypes;
	}

	// 获取规则下拉框数据
	@Override
	public List<Rule> selectRule() {
		List<Rule> rules = brokeRuleMapper.selectRule();
		return rules;
	}

	// 获取规则内容
	@Override
	public List<Rule> selectRuleContent(Integer id) {
		List<Rule> rules = brokeRuleMapper.selectRuleContent(id);
		return rules;
	}

	// 曝光台发布内容修改
	@Transactional(rollbackFor = Exception.class)
	public Integer updateBrokeRule(Integer ruleId, Integer brokeRule_id, String content, String adminName)
			throws Exception {
		int index1 = brokeRuleMapper.updateBrokeRule(ruleId, brokeRule_id);
		int index2 = userMapper.addLog(content, adminName);
		if (index1 > 0 && index2 > 0) {

			return 1;
		} else {

			throw new Exception("ERR");
		}
	}

	// 曝光台违规记录的删除
	@Transactional(rollbackFor = Exception.class)
	public Integer delBrokeRule(Integer brokeRule_id, String content, String adminName) throws Exception {

		int index1 = brokeRuleMapper.delBrokeRule(brokeRule_id);
		int index2 = userMapper.addLog(content, adminName);
		if (index1 > 0 && index2 > 0) {

			return 1;
		} else {

			throw new Exception("ERR");
		}
	}

	// 曝光台违规记录置顶
	@Transactional(rollbackFor = Exception.class)
	public Integer stickBrokeRule(Integer brokeRule_id, Integer brokeRule_rank, String content, String adminName)
			throws Exception {
		int index1 = brokeRuleMapper.beforeStick(brokeRule_rank);
		int index2 = brokeRuleMapper.stickBrokeRule(brokeRule_id);

		int index3 = userMapper.addLog(content, adminName);
		if (index1 <= 0) {
			return -1;
		}
		if (index1 > 0 && index2 > 0 && index3 > 0) {

			return 1;
		} else {

			throw new Exception("置顶违规记录失败！");
		}

	}
	
	//曝光台违规记录上线
	@Transactional(rollbackFor = Exception.class)
	public Integer upOrDownBrokeRule(Integer brokeRule_id, Integer state, String content, String adminName)
			throws Exception {
		
		int index1 = brokeRuleMapper.upOrDownBrokeRule(brokeRule_id,state);
		int index2 = userMapper.addLog(content, adminName);
		if (index1 > 0 && index2 > 0) {

			return 1;
		} else {

			throw new Exception("ERR");
		}
		
	}
	//获取所有用户下拉框数据
	@Override
	public List<User> selectUser() {
		List<User> users = brokeRuleMapper.selectUser();
		return users;
	}

	//规则类型ID查规则ID
	@Override
	public List<Rule> selectRuleId(Integer id) {
		List<Rule> rules = brokeRuleMapper.selectRuleId(id);
		return rules;
	}

	// 曝光台违规记录发布
	@Transactional(rollbackFor = Exception.class)
	public Integer createBrokeRule
	(Integer ruleId, Integer userId, String content, String adminName) throws Exception {
		int index1 = brokeRuleMapper.createBrokeRule(ruleId,userId);
		int index2 = userMapper.addLog(content, adminName);
		System.err.println(index1+"index1"); 
		System.err.println(index2+"index2"); 
		if (index1 > 0 && index2 > 0) {
			
			return 1;
		} else {

			throw new Exception("发布违规失败！");
		}
	}

}
