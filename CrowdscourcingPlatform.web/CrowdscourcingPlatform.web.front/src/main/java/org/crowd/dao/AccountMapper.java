package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.AccountModel;
import org.crowd.model.dto.AccountDetaDto;

/**
 * 
 * <p>
 * Title : AccountMapper
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
 * @date : 2018年12月12日 上午11:45:06
 * 
 * @version : 12.0.0
 */

public interface AccountMapper {

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

	// 支付--改变账务表状态
	Integer payAccount(@Param("id") Integer id);

	// 添加一条账务信息
	Integer addAccount(@Param("useId") Integer useId, @Param("proId") Integer proId, @Param("leaId") Integer leaId,
			@Param("neeId") Integer neeId, @Param("worId") Integer worId, @Param("money") Double money,
			@Param("state") Integer state, @Param("memo") String memo);

	// 修改账务信息
	Integer okAccount(@Param("workId") Integer workId);



}
