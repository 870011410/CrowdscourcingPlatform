package org.crowd.service.impl;

import org.crowd.dao.LogMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.User;
import org.crowd.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * 
 * <p>
 * Title : LoginServiceImpl
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
 * @date : 2018年12月9日 下午10:43:14
 * 
 * @version : 12.0.0
 */
@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private UserMapper userMapper;

	@Autowired
	private LogMapper logMapper;
	
	//登录
	@Override
	@Transactional(rollbackFor = Exception.class)
	public User LoginServer(String acc, String pwd) throws Exception {
		
		User user = userMapper.login(acc, pwd);
		int b = logMapper.createLog(user.getName(), "用户登录");

		if (user != null && b > 0) {
			return user;
		} else {
			throw new Exception("用户不存在");
		}
	}

}
