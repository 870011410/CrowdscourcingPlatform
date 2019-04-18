package org.crowd.service;


import org.crowd.model.Admin;


public interface AdminLoginService {
	//查询是登陆管理员的返回值
	Admin login(String acc,String pwd)throws Exception;

}
