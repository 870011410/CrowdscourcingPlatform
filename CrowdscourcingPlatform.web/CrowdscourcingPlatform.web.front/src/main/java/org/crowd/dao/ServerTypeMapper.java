package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.Picture;
import org.crowd.model.dto.ServerType_picture;

/**
 * 
     * <p>Title : ServerTypeMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月6日 下午6:59:00
     * @version : 12.0.0
 */
//服务类型的dao
public interface ServerTypeMapper {

	//查询所有的配置过的服务类型
	List<ServerType_picture> selectServerType();
	
	//获取所有的服务图标
	List<Picture> selectPicture();
	
	// 添加新的服务类型
	Integer addServerType
		(@Param("name")String name, @Param("id")Integer id);
	//查看服务类型是否重复
	Integer checkServerType(@Param("name")String name);
	
}

 
