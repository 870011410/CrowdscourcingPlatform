package org.crowd.service;

import com.alibaba.fastjson.JSONObject;

/**
 * 
     * <p>Title : AccountService</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月9日 上午9:42:21
     * @version : 12.0.0
 */
//账务对账的service接口
public interface AccountService {

	//显示账务信息(分页显示)
	JSONObject initAccount(Integer start, Integer limit, String name, String sTime, String eTime);
}
