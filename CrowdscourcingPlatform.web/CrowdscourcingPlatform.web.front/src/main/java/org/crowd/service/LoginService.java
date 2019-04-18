package org.crowd.service;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.User;

public interface LoginService {

	// 登录
	User LoginServer(@Param("acc") String acc, @Param("pwd") String pwd) throws Exception;

}
