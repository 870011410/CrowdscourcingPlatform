package org.crowd.dao;

import org.apache.ibatis.annotations.Param;

/**
 * 
 * <p>
 * Title : LogMapper
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
 * @date : 2018年12月9日 下午10:25:26
 * 
 * @version : 12.0.0
 */
public interface LogMapper {

	// 插入日志
	int createLog(@Param("name") String name, @Param("content") String content);

}
