package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Story;
import org.crowd.model.Trends;

/**
 * 
 * 
 * <p>
 * Title : TrendsMapper
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
 * @date : 2018年12月18日 下午4:22:34
 * 
 * @version : 12.0.0
 */
public interface TrendsMapper {
	// 查看所有行业动态总数
	int countAllTrends();

	// 分页查看所有行业动态
	List<Trends> showAllTrends(RowBounds rb);


}
