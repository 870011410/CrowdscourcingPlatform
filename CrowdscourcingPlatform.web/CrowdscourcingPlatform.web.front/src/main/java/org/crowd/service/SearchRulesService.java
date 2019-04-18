package org.crowd.service;

import java.util.List;

import org.crowd.model.dto.RuleCenter;

public interface SearchRulesService {
	//查询需求发布规则
	List<RuleCenter> searchRuleAboutPostNeed(Integer ruleTypeId);
	//查询投标规则
	List<RuleCenter> searchRuleAboutBid();
}
