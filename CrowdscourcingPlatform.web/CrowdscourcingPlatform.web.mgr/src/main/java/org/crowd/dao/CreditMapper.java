package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.UserDto;

/**
 * 
 * <p>
 * Title : CreditMapper
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
 * @date : 2018年12月9日 下午1:05:10
 * 
 * @version : 12.0.0
 */
public interface CreditMapper {

	// 查看所有用户信用分总数
	int countAllCredits(@Param("name") String name, @Param("orderBy") String oderBy, @Param("useType") Integer useType);

	// 分页查看所有用户信用分
	List<UserDto> showAllCredits(RowBounds rb, @Param("name") String name, @Param("orderBy") String orderBy,
			@Param("useType") Integer useType);

	// 修改用户信用分
	int updateCredit(@Param("id") Integer id, @Param("score") Integer score);
}
