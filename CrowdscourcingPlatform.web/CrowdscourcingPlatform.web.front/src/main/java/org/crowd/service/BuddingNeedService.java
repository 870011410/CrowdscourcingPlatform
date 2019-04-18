package org.crowd.service;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.dto.LeaMange;

/**
 * 
     * <p>Title : BuddingNeedService</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月12日 下午2:30:55
     * @version : 12.0.0
 */
//投标的事务接口
public interface BuddingNeedService {

	//查看这个人是否是盟主
	LeaMange checkUserIsLeaMan(Integer userId);
	//服务商个人投标
	Integer buddingTenderSingle(Integer needId,
			Integer ispId,String content,String userName) throws Exception;
	//判断服务商是否投标过了
    Integer checkIsBuddingSingle(Integer userId,Integer needId);
	
  //检查是否是自己的需求
  	Integer checkIsMyselfNeed(Integer userId,Integer needId);
  //检查联盟是否投过标了
  	Integer checkLeagueBudding(Integer needId,Integer leaId);
  	
  //联盟投标
  	Integer buddingTenderLeague(Integer needId,String content,Integer leaId,String userName) throws Exception;

}
