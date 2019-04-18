package org.crowd.controller;

import org.apache.ibatis.session.RowBounds;
import org.crowd.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : AccountController
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
 * @date : 2018年12月9日 上午9:37:58
 * @version : 12.0.0
 */
//账务对账的controller
@Controller
public class AccountController {

	
	//账务对账的service接口
	@Autowired
	private AccountService accServ;
	
	
	// 账务对账的表格数据页码
	@RequestMapping("initAccount.action")
	@ResponseBody
	public JSONObject initAccount(Integer start, Integer limit, String name, String sTime, String eTime) {


		JSONObject data = accServ.initAccount(start, limit, name, sTime, eTime);

		return data;
	}

}
