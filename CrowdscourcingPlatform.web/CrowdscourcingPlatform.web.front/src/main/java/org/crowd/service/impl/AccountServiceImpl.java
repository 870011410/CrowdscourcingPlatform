package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.AccountMapper;
import org.crowd.dao.LogMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.dto.AccountDetaDto;
import org.crowd.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * 
 * <p>
 * Title : AccountServiceImpl
 * </p>
 * 
 * <p>
 * Description :
 * </p>
 * 
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * 
 * <p>
 * DevelopSystem : Windows10
 * </p>
 * 
 * <p>
 * Company : org.wf
 * </p>
 * 
 * @author : WuFan
 * 
 * @date : 2018年12月12日 下午2:06:01
 * 
 * @version : 12.0.0
 */

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountMapper accountMapper;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private LogMapper logMapper;

	// 查看雇主的订单总数
	@Override
	public Integer countBuyerAccounts(String name, String title, String time_from, String time_to, Integer useId) {
		Integer i = accountMapper.countBuyerAccounts(name, title, time_from, time_to, useId);
		return i;
	}

	// 分页查看雇主的订单
	@Override
	public List<AccountDetaDto> showBuyerAccounts(RowBounds rb, String name, String title, String time_from,
			String time_to, Integer useId) {
		List<AccountDetaDto> list = accountMapper.showBuyerAccounts(rb, name, title, time_from, time_to, useId);
		return list;
	}

	@Override
	public Integer countProviderAccounts(String name, String title, String time_from, String time_to, Integer useId) {
		Integer i = accountMapper.countProviderAccounts(name, title, time_from, time_to, useId);
		return i;
	}

	@Override
	public List<AccountDetaDto> showProviderAccounts(RowBounds rb, String name, String title, String time_from,
			String time_to, Integer useId) {
		List<AccountDetaDto> list = accountMapper.showProviderAccounts(rb, name, title, time_from, time_to, useId);
		return list;
	}

	// 支付
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void payAccount(Integer useId, String useName, Integer accId, Double money) throws Exception {
		int a = userMapper.payAccount(useId, money);
		int b = accountMapper.payAccount(accId);
		int c = logMapper.createLog(useName, "支付了订单:" + accId);

		if (a > 0 && b > 0 && c > 0) {

		} else {
			throw new Exception("支付失败");
		}
	}

}
