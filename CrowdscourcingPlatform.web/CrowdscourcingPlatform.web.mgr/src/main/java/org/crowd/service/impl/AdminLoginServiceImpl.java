package org.crowd.service.impl;


import org.crowd.dao.LogMapper;
import org.crowd.dao.LoginMapper;
import org.crowd.model.Admin;
import org.crowd.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class AdminLoginServiceImpl implements AdminLoginService{

	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private LogMapper lm;

	@Transactional(rollbackFor = Exception.class)
	public Admin login(String acc, String pwd) throws Exception {
		Admin admin = loginMapper.login(acc,pwd);

		if(admin!=null) {
			Integer b = lm.createLog(admin.getName(), "登录");
			if(b>0) {
				return admin;
			}
		}
		return null;
		
	}

}