package org.crowd.service;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : NeedManageService
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
 * @date : 2018年12月7日 下午2:14:56
 * @version : 12.0.0
 */
//需求管理的事务
public interface NeedManageService {

	// 查看所有需求（分页显示）
	JSONObject selctNeedMeg(String title, String name, Integer needId, String sTime, String eTime, RowBounds rb);

	//修改需求的状态并记录
	Integer updateNeedState( Integer needId,Integer state,String ctrlName,String adminName) throws Exception;
	
	
}
