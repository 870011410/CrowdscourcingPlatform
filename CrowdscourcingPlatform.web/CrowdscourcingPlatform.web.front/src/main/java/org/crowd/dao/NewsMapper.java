package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.News;

/**
 * 
 * 
 * <p>
 * Title : NewsMapper
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
 * @date : 2018年12月18日 下午2:35:32
 * 
 * @version : 12.0.0
 */
public interface NewsMapper {
	// 分页查询行业资讯的信息
	List<News> searchNewsInfo(RowBounds rb);

	// 查询行业资讯的总数
	Integer searchNewsCount();
}