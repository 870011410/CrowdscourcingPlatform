package org.crowd.dao;


import org.apache.ibatis.annotations.Param;
import org.crowd.model.Admin;

public interface LoginMapper {
	//登陆
	Admin login(@Param("acc")String acc, @Param("pwd") String pwd);

}
