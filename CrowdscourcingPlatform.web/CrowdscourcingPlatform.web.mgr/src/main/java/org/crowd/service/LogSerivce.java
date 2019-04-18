package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Log;

/**
 * 
 * <p>
 * Title : LogSerivce
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
 * @date : 2018年12月8日 上午11:43:43
 * 
 * @version : 12.0.0
 */
public interface LogSerivce {
	// 查看日志总数
	int countLog(@Param("time_from") String time_from, @Param("time_to") String time_to, @Param("name") String name);

	// 分页查看日志
	List<Log> showLogs(RowBounds rb, @Param("time_from") String time_from, @Param("time_to") String time_to,
			@Param("name") String name);
}
