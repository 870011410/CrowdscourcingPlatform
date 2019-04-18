package org.crowd.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Rule;
import org.crowd.model.RuleType;
import org.crowd.model.User;
import org.crowd.model.dto.BrokeRuleDto;

import com.alibaba.fastjson.JSONObject;

public interface BrokeRuleService {
	//曝光台配置界面数据初始化
	List<BrokeRuleDto> initBrokeRule
	(String begin, String end, String name, Integer state, Integer rule,RowBounds rb);
	
	Integer initBrokeRuleCount
	(String begin, String end, String name, Integer state, Integer rule);
	
	// 获取规则类型下拉框数据
	List<RuleType> selectRuleType();
	
	
	//获取规则下拉框数据
	List<Rule> selectRule();
	
	//获取规则内容
	List<Rule> selectRuleContent(Integer id);
	
	//曝光台发布内容修改
	Integer updateBrokeRule
	(Integer ruleId, Integer brokeRule_id,String content,String adminName)throws Exception;
	
	
	//曝光台违规记录删除
	Integer delBrokeRule(Integer brokeRule_id,String content,String adminName)throws Exception;
	
	//曝光台违规记录置顶
	Integer stickBrokeRule
	(Integer brokeRule_id,Integer brokeRule_rank,String content,String adminName)throws Exception;

	//曝光台违规记录上线
	Integer upOrDownBrokeRule
	(Integer brokeRule_id,Integer state,String content,String adminName)throws Exception;
	
	//获取所有用户下拉框数据
	List<User> selectUser();
	
	//规则类型ID查规则ID
	List<Rule> selectRuleId(Integer id);
	
	// 曝光台违规记录发布
	Integer createBrokeRule
	(Integer ruleId, Integer userId,String content,String adminName)throws Exception;
}
