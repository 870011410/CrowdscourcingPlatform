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
public interface PostNeedMapper {

	
	//查询所有配置过的需求配置类型
	List<NeedTypeModel> selectNeedType();
    //添加新的需求
	Integer addNewNedd(@Param("userId") Integer userId, @Param("needTypeId") Integer needTypeId,@Param("title") String title,
			@Param("content") String content,@Param("require") String require,@Param("weekDate") String weekDate,
			@Param("money") Double money,@Param("endTime") String endTime);
	
}
