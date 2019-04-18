package org.crowd.service.impl;

import java.util.List;

import org.crowd.dao.ProviderTypeMapper;
import org.crowd.model.ProviderType;
import org.crowd.service.ProviderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProviderTypeServiceImpl implements ProviderTypeService {
	@Autowired
	private ProviderTypeMapper providerTypeMapper;

	// 从数据库中查处已经配置的服务商类型
	@Override
	public List<ProviderType> selectProviderType() {
		List<ProviderType> providerTypes = providerTypeMapper.selectProviderType();
		return providerTypes;
	}

}
