package org.crowd.service.impl;

import java.util.List;

import org.crowd.dao.ServerTypeMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.Picture;
import org.crowd.model.ServerTypeModel;
import org.crowd.model.dto.ServerType_picture;
import org.crowd.service.ServerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class ServerTypeServiceImpl implements ServerTypeService {

	@Autowired
	private ServerTypeMapper serverMapper;
	@Autowired
	UserMapper userMapper;
	
	//查询所有的配置过的服务类型
	@Transactional(rollbackFor = Exception.class)
	public List<ServerType_picture> selectServerType() {
		// TODO Auto-generated method stub
		List<ServerType_picture> serverTypes = serverMapper.selectServerType();
		
		return serverTypes;
	}
	//获取服务图标
	@Override
	public List<Picture> selectPicture() {
		List<Picture> picture = serverMapper.selectPicture();
		
		return picture;
	}
	

}
