package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.AccountMapper;
import org.crowd.model.dto.AccountDetaDto;
import org.crowd.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : AccountServiceImpl
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
 * @date : 2018年12月9日 上午9:44:32
 * @version : 12.0.0
 */
//账务对账的事务实现类
@Service
public class AccountServiceImpl implements AccountService {

	// 账务对账的dao
	@Autowired
	private AccountMapper accMapper;

	// 显示账务信息(分页显示)
	@Transactional(rollbackFor = Exception.class)
	public JSONObject initAccount(Integer start, Integer limit, String name, String sTime, String eTime) {
		// TODO Auto-generated method stub
		JSONObject data = new JSONObject();
		// 分页
		RowBounds rb = new RowBounds(start, limit);
	    //数量
		Integer count = accMapper.accountCount(name, sTime, eTime);
		//账务信息
		List<AccountDetaDto> accounts = accMapper.accountMeg(rb, name, sTime, eTime);
		//放入json
		data.put("count", count);
		data.put("accounts", accounts);
		return data;
		
	}

	
	
	
	
	
}
