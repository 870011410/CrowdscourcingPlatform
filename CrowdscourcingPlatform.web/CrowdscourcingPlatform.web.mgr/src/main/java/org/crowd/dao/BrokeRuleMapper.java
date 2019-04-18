package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Rule;
import org.crowd.model.RuleType;
import org.crowd.model.User;
import org.crowd.model.dto.BrokeRuleDto;

public interface BrokeRuleMapper {
	//曝光台配置界面数据初始化
	List<BrokeRuleDto> initBrokeRule
			(@Param("begin")String begin, @Param("end")String end,@Param("name")String name,
					@Param("state")Integer state,@Param("rule")Integer rule,RowBounds rb);
	Integer initBrokeRuleCount
			(@Param("begin")String begin, @Param("end")String end,@Param("name")String name,
					@Param("state")Integer state,@Param("rule")Integer rule);
	
	// 获取规则类型下拉框数据
	List<RuleType> selectRuleType();
	
	//获取规则下拉框数据
	List<Rule> selectRule();
	
	//获取规则内容
	List<Rule> selectRuleContent(@Param("id")Integer id);
	
	//曝光台发布内容修改
	Integer updateBrokeRule(@Param("ruleId")Integer ruleId,
							@Param("brokeRule_id")Integer brokeRule_id);
	
	//曝光台违规记录的删除
	Integer delBrokeRule(@Param("brokeRule_id")Integer brokeRule_id);
	
	// 置顶违规记录前先后移之前的记录
	Integer beforeStick(@Param("brokeRule_rank") Integer brokeRule_rank);
	
	// 置顶违规记录
	Integer stickBrokeRule(@Param("brokeRule_id")Integer brokeRule_id);
	
	//曝光台违规记录上线
	Integer upOrDownBrokeRule(@Param("brokeRule_id")Integer brokeRule_id, 
							@Param("state")Integer state);
	//获取所有用户下拉框数据
	List<User> selectUser();
	
	//规则类型ID查规则ID
	List<Rule> selectRuleId(@Param("id")Integer id);
	
	// 曝光台违规记录发布
	Integer createBrokeRule(@Param("ruleId")Integer ruleId, @Param("userId")Integer userId);
	
}
