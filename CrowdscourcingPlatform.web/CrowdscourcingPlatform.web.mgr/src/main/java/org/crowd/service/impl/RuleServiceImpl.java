package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.RuleMapper;
import org.crowd.model.dto.RuleCenter;
import org.crowd.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class RuleServiceImpl implements RuleService {
	
	@Autowired
	private RuleMapper ruleMapper;
	@Autowired
	private LogMapper lm;
	
	//创建规则的事务
	@Transactional(rollbackFor = Exception.class)
	public Integer createRule(Integer rteId,String content,Integer score,Integer state,String admName) throws Exception{
		
		Integer index=0;
		Integer b = lm.createLog(admName, "新增一条规则" );
		index=ruleMapper.createRule(rteId, content, score, state);
		
		if(index>0 && b > 0) {
			return index;
		}else {
			throw new Exception();
		}		
	}
	
	//删除规则的事务
	@Transactional(rollbackFor = Exception.class)
	public Integer deleteRule(Integer id,String admName) throws Exception{
		
		Integer index=0;
		Integer b = lm.createLog(admName, "删除了ID为"+id+"的规则");		
		index=ruleMapper.deleteRule(id);
		
		if(index>0 && b > 0) {
			return index;
		}else {
			throw new Exception();
		}		
	}
	
	//修改规则的事务
	@Transactional(rollbackFor = Exception.class)
	public Integer modifyRule(Integer id,Integer rteId,String content,Integer score,Integer state,String admName) throws Exception{
		
		Integer index=0;
		Integer b = lm.createLog(admName, "修改了ID为"+id+"的规则");			
		index=ruleMapper.modifyRule(id, rteId, content, score, state);
		
		if(index>0 && b > 0) {
			return index;
		}else {
			throw new Exception();
		}		
	}
	
	//分页查询规则信息
	public List<RuleCenter> searchRuleInfo(Integer rteId,Integer state,String content,RowBounds rb) {
		List<RuleCenter> ruleList=ruleMapper.searchRuleInfo(rteId, state, content, rb);
		return ruleList;
	}
	
	//查询规则的总数量
	public Integer searchRuleCount(Integer rteId,Integer state,String content) {
		Integer count=ruleMapper.searchRuleCount(rteId, state, content);
		return count;
	}
	
	//规则的发布&取消发布
	@Transactional(rollbackFor = Exception.class)
	public Integer changeRuleState(Integer state,Integer id,String admName) throws Exception{
		
		Integer index=0;
		String stateName="上线";
		if(state==0) {
			stateName="下线";
		}
		
		Integer b = lm.createLog(admName,stateName+"了ID为"+id+"的规则");				
		index=ruleMapper.changeRuleState(state, id);
		
		if(index>0 && b > 0) {
			return index;
		}else {
			throw new Exception();
		}		
	}
	
	
}
