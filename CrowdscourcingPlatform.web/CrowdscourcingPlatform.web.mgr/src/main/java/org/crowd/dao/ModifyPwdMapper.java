package org.crowd.dao;

import org.apache.ibatis.annotations.Param;

public interface ModifyPwdMapper {
	
	//修改密码
	Integer modifyPwd(@Param("acc") String id,@Param("pwd") String pwd); 

}
