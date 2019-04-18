package org.crowd.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Rule;
import org.crowd.model.dto.RuleCenter;

/**
 * <p>Title : RuleService</p>
 * <p>Description : </p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Win10 x64 </p>
 * <p>Company : org.Lw</p>
 * @author : Lw
 * @date : 2018年12月20日 上午10:47:59
 * @version : 12.0.0
 */
public interface RuleService {
	//创建规则的事务
	Integer createRule(Integer rteId,String content,Integer score,Integer state,String admName) throws Exception;
	//删除规则的事务
	Integer deleteRule(Integer id,String admName) throws Exception;
	//修改规则的事务
	Integer modifyRule(Integer id,Integer rteId,String content,Integer score,Integer state,String admName) throws Exception;
	//分页查询规则信息
	List<RuleCenter> searchRuleInfo(Integer rteId,Integer state,String content,RowBounds rb);
	//查询规则的总数量
	Integer searchRuleCount(Integer rteId,Integer state,String content);
	//规则的发布&取消发布	
	Integer changeRuleState(Integer state,Integer id,String admName) throws Exception;
}
