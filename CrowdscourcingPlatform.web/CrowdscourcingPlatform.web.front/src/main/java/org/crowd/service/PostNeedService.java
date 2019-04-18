package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.NeedTypeModel;
/**
 * 
     * <p>Title : PostNeedService</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月10日 上午8:41:39
     * @version : 12.0.0
 */
//发布需求的service
public interface PostNeedService {

	// 查询所有配置过的需求配置类型
	List<NeedTypeModel> selectNeedType();
    //添加新的需求
	Integer addNewNeed(String userName,Integer userId,Integer needTypeId,String title
			,String content,String require,String weekDate,Double money,String endTime) throws Exception;
}
