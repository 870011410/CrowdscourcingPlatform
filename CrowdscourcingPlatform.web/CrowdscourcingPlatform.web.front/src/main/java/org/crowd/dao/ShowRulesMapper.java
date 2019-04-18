package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.dto.RuleCenter;

public interface ShowRulesMapper {
	//查询需求发布规则
	List<RuleCenter> searchRuleAboutPostNeed(@Param("ruleTypeId")Integer ruleTypeId);
	//查询投标规则
	List<RuleCenter> searchRuleAboutBid();
}
