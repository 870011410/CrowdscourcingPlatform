package org.crowd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.User;

public interface UserService {
	//雇主管理界面数据分页初始化
	 List<User> initUser(String name, String begin, String end,Integer type, RowBounds rb);
	 Integer initUserCount(String name, String begin, String end,Integer type);
	 
	//用户的锁定与恢复的事务
	Integer motifyState(Integer userId,String adminName, Integer state,String content) throws Exception;
	
	 //用户密码的重置
    Integer resetPwd(Integer userId,String pwd,String adminName,String content) throws Exception;
	 
	//设置或取消顾问资格
    Integer canseOrSetAdv(Integer type,Integer userId,String userName,String ctrl,String adminName) throws Exception;

}
