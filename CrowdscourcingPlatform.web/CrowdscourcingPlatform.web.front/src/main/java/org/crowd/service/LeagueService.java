package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.LeaMange;
import org.crowd.model.dto.LeaUserLinkDto;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : LeagueService
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : macOS Sierra 10.12.1
 * </p>
 * <p>
 * Company : org.crowds
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月17日 上午11:02:04
 * @version : 12.0.0
 */
public interface LeagueService {

	// 检查用户是否加入了联盟
	Boolean checkUserLeague(Integer userId);

	// 新建一个联盟
	Integer createNewLeague(String leaName, Integer userId, String content, String src, String userName)
			throws Exception;

	// 检查联盟名是否重复
	Integer checkLeaNameIsReapet(String leaName);

	// 判断是否是盟主
	LeaMange checkUserIsMaster(Integer userId);

	// 判断用户是否加入了联盟（非盟主）
	LeaMange checkUserAddLea(Integer userId);

	// 统计某个联盟的人数
	Integer selectLeaCountWithLeaId(Integer leaId);

	// 联盟浏览的分页显示
	JSONObject selectLeaMeg(Integer start, Integer limit);

	// 用户是否是盟主（所有的 审核通过的，封杀的 ，待审核的）
	LeaMange checkUserIsMasterAll(Integer userId);

	// 申请加入联盟
	Integer applyJoinLeague(Integer leaId, Integer userId, String userName) throws Exception;

	// 查服务商是否申请过这个联盟了
	Integer checkUserIsApplyThisLea(Integer leaId, Integer userId);

	// 显示某个联盟的所有申请人
	List<LeaUserLinkDto> selectPeopleWithLeague(RowBounds rb,Integer leaId,
			String check_name,Integer check_state,
			String check_time_from,String check_time_to);

	// 联盟申请人数
	Integer selectPeopleWithLeagueCount(Integer leaId,String check_name,
			Integer check_state,String check_time_from,
			String check_time_to);

	//改变联盟成员的审核状态
	Integer updateLeagueUserState(Integer audiId,Integer state,String leaMaster,String meg) throws Exception;

	//剔除某个联盟成员
	Integer deleteLeagueUser(Integer audiId,String leaMaster,String meg) throws Exception;
}
