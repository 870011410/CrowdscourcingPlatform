package org.crowd.dao;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.User;
import org.crowd.model.dto.LeaMange;
import org.springframework.stereotype.Service;

/**
 * 
 * 
 * <p>
 * Title : UserMapper
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
 * @date : 2018年12月9日 下午10:48:45
 * 
 * @version : 12.0.0
 */

@Service
public interface UserMapper {

	// 登录
	User login(@Param("acc") String acc, @Param("pwd") String pwd);

	// 查看用户名是否重复
	int checkUserName(@Param("id") Integer id, @Param("name") String name);

	// 修改个人基本信息
	int updateUserInfo(@Param("id") Integer id, @Param("name") String name, @Param("memo") String memo,
			@Param("phone") String phone, @Param("email") String email, @Param("src") String src);

	// 修改后返回user对象
	User afterUpdate(@Param("id") Integer id);

	// 充值
	int recharge(@Param("id") Integer id, @Param("money") Double money);

	// 查看这个人是否是盟主
	LeaMange checkUserIsLeaMan(@Param("userId") Integer userId);

	// 查看账号是否重复
	int checkUserAcc(@Param("acc") String acc);

	// 注册时查看昵称是否重复
	int checkRegName(@Param("name") String name);

	// 注册
	int reg(@Param("acc") String acc, @Param("pwd") String pwd, @Param("name") String name,
			@Param("phone") String phone, @Param("email") String email);

	// 支付--扣钱
	int payAccount(@Param("id") Integer id, @Param("money") Double money);

	// 修改密码
	int updatePwd(@Param("id") Integer id, @Param("newPwd") String newPwd);
	
	//查询卖家ID
	Integer selectUserId(@Param("userName") String userName);

	// 成为服务商
	int beProvider(@Param("userId") Integer userId,@Param("providerId") Integer providerId);

}
