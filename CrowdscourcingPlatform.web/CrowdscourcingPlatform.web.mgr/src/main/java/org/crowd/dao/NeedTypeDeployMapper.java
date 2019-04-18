package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.NeedTypeModel;

/**
 * 
     * <p>Title : NeedTypeDeployMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月6日 下午3:26:40
     * @version : 12.0.0
 */
//需求类型配置的dao接口
public interface NeedTypeDeployMapper {

	
	//查询所有配置过的需求配置类型
	List<NeedTypeModel> selectNeedType();
	
	//添加一个新的需求类型
	Integer addNewNeedType(@Param("needTypeName") String needTypeName,@Param("serverId") Integer serverId);
	
	//判断这个需求名字是否已经存在
	
	String checkNeedName(@Param("needTypeName") String needTypeName);
	
}
