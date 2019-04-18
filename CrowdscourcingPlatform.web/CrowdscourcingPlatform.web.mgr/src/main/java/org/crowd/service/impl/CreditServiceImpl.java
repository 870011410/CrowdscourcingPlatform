package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.CreditMapper;
import org.crowd.dao.LogMapper;
import org.crowd.model.dto.UserDto;
import org.crowd.service.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * <p>
 * Title : CreditServiceImpl
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
 * @date : 2018年12月9日 下午5:59:33
 * 
 * @version : 12.0.0
 */
@Service
public class CreditServiceImpl implements CreditService {

	@Autowired
	private CreditMapper cm;

	@Autowired
	private LogMapper lm;

	// 查看所有用户信用分总数
	@Override
	public int countAllCredits(String name, String orderBy, Integer useType) {
		int i = cm.countAllCredits(name, orderBy, useType);
		return i;
	}

	// 分页查看所有用户信用分
	@Override
	public List<UserDto> showAllCredits(RowBounds rb, String name, String orderBy, Integer useType) {
		List<UserDto> list = cm.showAllCredits(rb, name, orderBy, useType);
		return list;
	}

	// 修改用户信用分
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateCredit(Integer id, String name, Integer score, String admName) throws Exception {
		int a = cm.updateCredit(id, score);
		System.out.println("admName:" + admName);
		System.out.println("name:" + name);
		int b = lm.createLog(admName, "修改了用户" + name + "的积分");
		System.out.println("bbbbbbbb:" + b);
		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}

	}

}
