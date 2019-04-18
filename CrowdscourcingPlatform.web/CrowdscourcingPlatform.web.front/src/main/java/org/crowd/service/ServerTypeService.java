package org.crowd.service;

import java.util.List;

import org.crowd.model.Picture;
import org.crowd.model.dto.ServerType_picture;

public interface ServerTypeService {

	//查询所有的配置过的服务类型
	List<ServerType_picture> selectServerType();
	
	//获取所有的服务图标
	List<Picture> selectPicture();
	
}
