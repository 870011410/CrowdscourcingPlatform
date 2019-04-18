package org.crowd.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.User;



public interface UserMapper {
	//操作日志的添加
	int addLog(@Param("content")String content, @Param("adminName")String adminName);
	//雇主管理界面数据分页初始
	List<User> initUser(@Param("name")String name,@Param("begin")String begin, 
							@Param("end")String end,@Param("type")Integer type,RowBounds rb);
	Integer initUserCount(@Param("name")String name,@Param("begin")String begin, 
							@Param("end")String end,@Param("type")Integer type);
	
	//用户的锁定与恢复
    Integer motifyState
    (@Param("userId")Integer userId,@Param("state")Integer state);
    
    //用户密码的重置
    Integer resetPwd(@Param("userId")Integer userId,@Param("pwd")String pwd);
   
   //将用户设置为顾问或取消顾问资格
    Integer canseOrSetAdv(@Param("userId") Integer userId,@Param("type") Integer type);
	
	

}
