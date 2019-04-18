package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.User;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : LeaManageService
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : window 7
 * </p>
 * <p>
 * Company : org.crowd
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月8日 上午9:53:51
 * @version : 12.0.0
 */
//联盟管理的service
public interface LeaManageService {

	// 查看所有盟主
	List<User> selectLeaMaster();

	// 联盟管理的分页显示
	JSONObject selectLeaMeg(Integer start, Integer limit, String leaName, String sTime, String eTime,
			Integer leaMasterId);

	// 修改联盟的状态
	Integer updateLeaState(Integer leaId, String ctrlMeg, Integer state, String adminName) throws Exception;

	// 查某个联盟的成员

	List<String> selectUserWithLea( Integer leaId);

}
