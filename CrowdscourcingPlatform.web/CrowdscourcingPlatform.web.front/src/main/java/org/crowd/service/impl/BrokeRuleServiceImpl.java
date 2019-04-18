package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.BrokeRuleMapper;
import org.crowd.model.dto.BrokeRuleDto;
import org.crowd.service.BrokeRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BrokeRuleServiceImpl implements BrokeRuleService {
	@Autowired
	private BrokeRuleMapper brokeRuleMapper;// 曝光台界面Dao

	// 曝光台配置界面数据初始化
	@Override
	public List<BrokeRuleDto> initBrokeRule(RowBounds rb) {
		List<BrokeRuleDto> brokeRuleDtos = brokeRuleMapper.initBrokeRule(rb);
		return brokeRuleDtos;
	}

	@Override
	public Integer initBrokeRuleCount() {
		Integer count = brokeRuleMapper.initBrokeRuleCount();
		return count;
	}

}
