package org.crowd.service.impl;

import org.crowd.dao.LogMapper;
import org.crowd.dao.UserMapper;
import org.crowd.model.User;
import org.crowd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * <p>
 * Title : UserServiceImpl
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
 * @date : 2018年12月11日 下午3:17:09
 * 
 * @version : 12.0.0
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private LogMapper logMapper;

	// 查看用户名是否重复
	@Override
	public int checkUserName(Integer id, String name) {
		int i = userMapper.checkUserName(id, name);
		return i;
	}

	// 修改用户个人信息
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateUserInfo(Integer id, String name, String memo, String phone, String email, String src)
			throws Exception {

		int a = userMapper.updateUserInfo(id, name, memo, phone, email, src);
		int b = logMapper.createLog(name, "修改了自己的基本信息");

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
	}

	// 修改后返回user对象
	@Override
	public User afterUpdate(Integer id) {
		User user = userMapper.afterUpdate(id);
		return user;
	}

	// 充值
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void recharge(Integer id, Double money, String name) throws Exception {

		int a = userMapper.recharge(id, money);
		int b = logMapper.createLog(name, "充值了：" + money + "元");

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("充值失败");
		}
	}

	// 查看账号是否重复
	@Override
	public int checkUserAcc(String acc) {
		int i = userMapper.checkUserAcc(acc);
		return i;
	}

	// 注册时查看昵称是否重复
	@Override
	public int checkRegName(String name) {
		int i = userMapper.checkRegName(name);
		return i;
	}

	// 注册
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void reg(String acc, String pwd, String name, String phone, String email) throws Exception {
		int a = userMapper.reg(acc, pwd, name, phone, email);
		int b = logMapper.createLog(name, "注册");

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("充值失败");
		}
	}

	// 修改密码
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updatePwd(Integer id, String newPwd, String name) throws Exception {
		int a = userMapper.updatePwd(id, newPwd);
		int b = logMapper.createLog(name, "修改了密码");

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
	}

	// 成为服务商
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void beProvider(Integer userId, Integer providerId, String userName) throws Exception {
		int a = userMapper.beProvider(userId, providerId);
		int b = logMapper.createLog(userName, "入驻为服务商");

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("入驻失败");
		}
	}

}
