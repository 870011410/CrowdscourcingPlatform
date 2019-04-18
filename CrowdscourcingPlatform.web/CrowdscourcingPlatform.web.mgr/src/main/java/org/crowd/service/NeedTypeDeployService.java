package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.NeedTypeModel;

/** 
 * <p>Title : NeedTypeDeployService</p>
 * <p>Description :</p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : window 7</p>
 * <p>Company : org.crowd</p>
 * @author : zhengjiawei
 * @date : 2018年12月6日 下午3:39:53
 * @version : 12.0.0
 */
//处理需求类型分配的service
public interface NeedTypeDeployService {

	// 查询所有配置过的需求配置类型
	List<NeedTypeModel> selectNeedType();

	//添加一个新的需求类型
	Integer addNewNeedType( String needTypeName, Integer serverId,String admName) throws Exception;
}
