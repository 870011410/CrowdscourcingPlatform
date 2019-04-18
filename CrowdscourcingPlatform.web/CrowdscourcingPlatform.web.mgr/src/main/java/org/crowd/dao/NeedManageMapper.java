package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.NeedDeti;

/**
 * 
     * <p>Title : NeedManageMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月7日 上午11:35:48
     * @version : 12.0.0
 */
//需求管理的dao
public interface NeedManageMapper {

	//查询需求的总条数
	Integer selectNeedCount(@Param("title") String title,@Param("name") String name,
			@Param("needId") Integer needId,@Param("sTime") String sTime,
			@Param("eTime") String eTime);

    //查询需求的数据
		List<NeedDeti> selectNeedMeg(@Param("title") String title,@Param("name") String name,
				@Param("needId") Integer needId,@Param("sTime") String sTime,
				@Param("eTime") String eTime,RowBounds rb);
		
    //修改需求的状态
		Integer updateNeedState(@Param("needId") Integer needId,@Param("state") Integer state);
}
