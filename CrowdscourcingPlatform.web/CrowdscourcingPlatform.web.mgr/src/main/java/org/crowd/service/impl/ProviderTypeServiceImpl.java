package org.crowd.service.impl;

import java.util.List;

import org.crowd.dao.ProviderTypeMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.ProviderType;
import org.crowd.service.ProviderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProviderTypeServiceImpl implements ProviderTypeService {
	@Autowired
	private ProviderTypeMapper providerTypeMapper;
	@Autowired
	UserMapper userMapper;
	
	
	//从数据库中查处已经配置的服务商类型
	@Override
	public List<ProviderType> selectProviderType() {
		List<ProviderType> providerTypes = providerTypeMapper.selectProviderType();
		return providerTypes;
	}

	//新增服务商类型
	@Transactional(rollbackFor = Exception.class)
	public Integer addProviderType(String name, String content, String adminName) throws Exception {
		Integer index1 = providerTypeMapper.checkProviderType(name);
		int index2 = providerTypeMapper.addProviderType(name);
		int index3 = userMapper.addLog(content, adminName);
		if (index1 != null) {
			return -1;
		}
		if (index2 > 0 && index3 > 0) {

			return 1;
		} else {

			throw new Exception("新增服务商类型失败！");
		}
	}

}
