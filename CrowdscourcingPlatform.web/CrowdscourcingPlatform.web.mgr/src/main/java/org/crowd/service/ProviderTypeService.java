package org.crowd.service;

import java.util.List;

import org.crowd.model.ProviderType;

public interface ProviderTypeService {
	
	
	//从数据库中查处已经配置的服务商类型
	List<ProviderType> selectProviderType();
	
	//新增服务商类型
	Integer addProviderType(String name,String content,String adminName)throws Exception ;
}
