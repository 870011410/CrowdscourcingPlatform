package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.RuleCenter;

public interface RuleMapper {
	
	//新增一条规则
	Integer createRule(@Param("rteId")Integer rteId,@Param("content")String content,@Param("score")Integer score,@Param("state")Integer state);
	//删除一条规则
	Integer deleteRule(@Param("id")Integer id);
	//修改一条规则
	Integer modifyRule(@Param("id")Integer id,@Param("rteId")Integer rteId,@Param("content")String content,@Param("score")Integer score,@Param("state")Integer state);
	//分页查询规则数据信息
	List<RuleCenter> searchRuleInfo(@Param("rteId")Integer rteId,@Param("state")Integer state,@Param("content")String content,RowBounds rb);
	//查询规则数据的总数
	Integer searchRuleCount(@Param("rteId")Integer rteId,@Param("state")Integer state,@Param("content")String content);
	//规则的发布&取消发布
	Integer changeRuleState(@Param("state")Integer state,@Param("id")Integer id);
}
