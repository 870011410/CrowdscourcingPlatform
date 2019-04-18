package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.User;
import org.crowd.model.dto.LeaMange;

/**
 * 
     * <p>Title : LeaManageMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月8日 上午9:35:04
     * @version : 12.0.0
 */
//联盟管理的dao
public interface LeaManageMapper {

	//查找所有的盟主
	List<User> selectLeaMaster();
	//联盟的个数
	Integer selectLeaCount(@Param("leaName") String leaName, 
			@Param("sTime") String sTime,@Param("eTime") String eTime,
			@Param("leaMasterId") Integer leaMasterId);
	
	//联盟信息
	List<LeaMange> selectLeaMeg(@Param("leaName") String leaName, 
			@Param("sTime") String sTime,@Param("eTime") String eTime,
			@Param("leaMasterId") Integer leaMasterId,RowBounds rb);
	
	//修改联盟的状态
	Integer updateLeaState(@Param("leaId") Integer leaId,@Param("state") Integer state);
	//联盟的成员
	List<String> selectUserWithLea(@Param("leaId") Integer leaId);	
	//统计某个联盟的人数
	Integer selectLeaCountWithLeaId(@Param("leaId") Integer leaId);
	
	
	
}
