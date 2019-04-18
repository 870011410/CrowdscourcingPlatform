package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.LeaMange;
import org.crowd.model.dto.LeaUserLinkDto;

/**
 * 
     * <p>Title : LeagueMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月17日 上午10:43:32
     * @version : 12.0.0
 */
//联盟中心的dao
public interface LeagueMapper {

	//检测用户是否加入了联盟（非盟主）
	LeaMange checkUserAddLea(@Param("userId") Integer userId);
	
	//新建一个联盟
	Integer createNewLeague(@Param("leaName") String leaName,@Param("userId") Integer userId,@Param("content") String content,@Param("src") String src);
    //检查联盟名是否重复
	Integer checkLeaNameIsReapet(@Param("leaName") String leaName);
	//统计某个联盟的人数
	Integer selectLeaCountWithLeaId(@Param("leaId") Integer leaId);
	//查询所有联盟的数据（浏览联盟）
	List<LeaMange> selectLeaMeg(RowBounds rb);
	//联盟的个数
	Integer selectLeaCount();
	//判断用户是否是盟主（审核通过的）
	// 查看这个人是否是盟主
	LeaMange checkUserIsLeaMaster(@Param("userId") Integer userId);
	//查服务商是否申请过这个联盟了
	Integer checkUserIsApplyThisLea(@Param("leaId") Integer leaId,@Param("userId") Integer userId);
	//申请加入联盟
	Integer applyJoinLeague(@Param("leaId") Integer leaId,@Param("userId") Integer userId);

	//显示某个联盟的所有申请人
	List<LeaUserLinkDto> selectPeopleWithLeague(RowBounds rb,@Param("leaId") Integer leaId,
				@Param("check_name") String check_name,@Param("check_state") Integer check_state,
				@Param("check_time_from") String check_time_from,@Param("check_time_to") String check_time_to);
	//联盟申请人数
	Integer selectPeopleWithLeagueCount(@Param("leaId") Integer leaId,
			@Param("check_name") String check_name,@Param("check_state") Integer check_state,
			@Param("check_time_from") String check_time_from,@Param("check_time_to") String check_time_to);
    
	//改变联盟人员审核的状态
	Integer updateLeagueUserState(@Param("audiId") Integer audiId,@Param("state") Integer state);

	//剔除某个联盟成员
	Integer deleteLeagueUser(@Param("audiId") Integer audiId);
}
