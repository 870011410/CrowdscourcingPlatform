package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.ProviderType;

public interface ProviderTypeMapper {
	// 从数据库中查找已经配置的服务商类型
	List<ProviderType> selectProviderType();

}
