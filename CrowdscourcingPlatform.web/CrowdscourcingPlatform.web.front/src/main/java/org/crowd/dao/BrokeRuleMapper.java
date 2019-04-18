package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.BrokeRuleDto;

public interface BrokeRuleMapper {
	// 曝光台配置界面数据初始化
	List<BrokeRuleDto> initBrokeRule(RowBounds rb);

	Integer initBrokeRuleCount();

}
