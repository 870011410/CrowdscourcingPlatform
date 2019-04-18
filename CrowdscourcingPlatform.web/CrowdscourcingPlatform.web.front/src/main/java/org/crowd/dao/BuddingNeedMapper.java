package org.crowd.dao;

import org.apache.ibatis.annotations.Param;

/**
 * 
     * <p>Title : BuddingNeedMapper</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月13日 上午10:36:13
     * @version : 12.0.0
 */
//投标的dao
public interface BuddingNeedMapper {

	//服务商单人投标（添加一条投标表记录）
	Integer buddingTenderSingle(@Param("needId") Integer needId,
			@Param("ispId") Integer ispId,@Param("content") String content);
	//判断服务商是否投标过了
	Integer checkIsBuddingSingle(@Param("userId") Integer userId,@Param("needId") Integer needId);

    //检查是否是自己的需求
	Integer checkIsMyselfNeed(@Param("userId") Integer userId,@Param("needId") Integer needId);

    //检查联盟是否投标过了
	Integer checkLeagueBudding(@Param("needId") Integer needId,@Param("leaId") Integer leaId);
    
	//联盟投标
	Integer buddingTenderLeague(@Param("needId") Integer needId,@Param("content") String content,@Param("leaId") Integer leaId);

}
