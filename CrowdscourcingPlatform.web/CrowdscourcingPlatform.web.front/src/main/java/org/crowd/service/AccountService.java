package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.AccountDetaDto;

/**
 * 
 * 
 * <p>
 * Title : AccountService
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
 * @date : 2018年12月12日 下午2:04:49
 * 
 * @version : 12.0.0
 */
public interface AccountService {

	// 查看雇主的订单总数
	Integer countBuyerAccounts(@Param("name") String name, @Param("title") String title,
			@Param("time_from") String time_from, @Param("time_to") String time_to, @Param("useId") Integer useId);

	// 分页查看雇主的订单
	List<AccountDetaDto> showBuyerAccounts(RowBounds rb, @Param("name") String name, @Param("title") String title,
			@Param("time_from") String time_from, @Param("time_to") String time_to, @Param("useId") Integer useId);

	// 查看服务商的订单总数
	Integer countProviderAccounts(@Param("name") String name, @Param("title") String title,
			@Param("time_from") String time_from, @Param("time_to") String time_to, @Param("useId") Integer useId);

	// 分页查看服务商的订单
	List<AccountDetaDto> showProviderAccounts(RowBounds rb, @Param("name") String name, @Param("title") String title,
			@Param("time_from") String time_from, @Param("time_to") String time_to, @Param("useId") Integer useId);

	// 支付
	void payAccount(@Param("useId") Integer useId, @Param("useName") String useName, @Param("accId") Integer accId,
			@Param("money") Double money) throws Exception;
}
