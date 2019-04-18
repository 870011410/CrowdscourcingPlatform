package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.ProviderType;

public interface ProviderTypeMapper {
	//从数据库中查处已经配置的服务商类型	
	 List<ProviderType> selectProviderType();
	 
	//检查服务商类型名称是否重复
	 Integer checkProviderType(@Param("name")String name);
	 
	//新增服务商类型
	 Integer addProviderType(@Param("name")String name);
}
