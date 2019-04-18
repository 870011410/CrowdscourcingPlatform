package org.crowd.service;

import org.apache.ibatis.annotations.Param;
import org.crowd.model.User;

/**
 * 
 * <p>
 * Title : UserService
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
 * @date : 2018年12月11日 下午3:16:55
 * 
 * @version : 12.0.0
 */
public interface UserService {
	// 查看用户名是否重复
	int checkUserName(@Param("id") Integer id, @Param("name") String name);

	// 修改个人基本信息
	void updateUserInfo(@Param("id") Integer id, @Param("name") String name, @Param("memo") String memo,
			@Param("phone") String phone, @Param("email") String email, @Param("src") String src) throws Exception;

	// 修改后返回user对象
	User afterUpdate(@Param("id") Integer id);

	// 充值
	void recharge(@Param("id") Integer id, @Param("money") Double money, @Param("name") String name) throws Exception;

	// 查看账号是否重复
	int checkUserAcc(@Param("acc") String acc);

	// 注册时查看昵称是否重复
	int checkRegName(@Param("name") String name);

	// 注册
	void reg(@Param("acc") String acc, @Param("pwd") String pwd, @Param("name") String name,
			@Param("phone") String phone, @Param("email") String email) throws Exception;

	// 修改密码
	void updatePwd(@Param("id") Integer id, @Param("newPwd") String newPwd, @Param("name") String name)
			throws Exception;

	// 成为服务商
	void beProvider(@Param("userId") Integer userId, @Param("providerId") Integer providerId,@Param("userName") String userName) throws Exception;

}
