package org.crowd.service.impl;

import java.util.List;

import org.crowd.dao.ShowRulesMapper;
import org.crowd.model.dto.RuleCenter;
import org.crowd.service.SearchRulesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchRulesServiceImpl implements SearchRulesService {
	
	@Autowired
	ShowRulesMapper showRulesMapper;
	
	//查询需求发布规则
	public List<RuleCenter> searchRuleAboutPostNeed(Integer ruleTypeId){
		List<RuleCenter> list=showRulesMapper.searchRuleAboutPostNeed(ruleTypeId);
		return list;
	}
	
	//查询投标规则
	public List<RuleCenter> searchRuleAboutBid(){
		List<RuleCenter> list=showRulesMapper.searchRuleAboutBid();
		return list;
	}
}
