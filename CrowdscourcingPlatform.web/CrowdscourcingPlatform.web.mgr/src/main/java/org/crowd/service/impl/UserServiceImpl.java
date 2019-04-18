package org.crowd.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.UserMapper;
import org.crowd.model.User;
import org.crowd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;
	
	//雇主管理界面数据分页初始化
	
	public List<User> initUser(String name, String begin, String end,Integer type, RowBounds rb) {
		List<User> user=userMapper.initUser(name, begin, end,type, rb);
		return user;
	}
	
	public Integer initUserCount(String name, String begin, String end,Integer type) {
		Integer count=userMapper.initUserCount(name, begin, end,type);
		return count;
	}
	//用户的锁定与恢复的事务
	@Transactional(rollbackFor = Exception.class)
	public Integer motifyState(Integer userId,String adminName, Integer state,String content) throws Exception {
		
		int index1=userMapper.motifyState(userId, state);
		int index2=userMapper.addLog(content, adminName);
		if(index1>0&&index2>0) {
			
			return 1;
		}else {
			
			throw new Exception("ERR");
		}
	}
	
	//用户密码的重置
		@Transactional(rollbackFor = Exception.class)
		public Integer resetPwd(Integer userId,String pwd,String adminName,String content) throws Exception {
			
			int index1=userMapper.resetPwd(userId,pwd);
			int index2=userMapper.addLog(content, adminName);
			
			if(index1>0&&index2>0) {
				return 1;
			}else {
				
				throw new Exception("ERR");
			}
		}

		//设置或取消顾问资格（zjw）
		@Transactional(rollbackFor = Exception.class)
		public Integer canseOrSetAdv(Integer type, Integer userId, String userName, String ctrl, String adminName) throws Exception {
			// TODO Auto-generated method stub
			
			//改变用户类型
			Integer index1 = userMapper.canseOrSetAdv(userId, type);
			
			//记录日志
			Integer index2 = userMapper.addLog(ctrl, adminName);
			
			if(index1>0&&index2>0) {
				return 1;
			}else {
				throw new Exception();
			}
			
		}



}
