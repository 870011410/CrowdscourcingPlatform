package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Story;
import org.crowd.model.Trends;

/** 
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
 * @date : 2018年12月7日 下午4:13:36
 * 
 * @version : 12.0.0
 */
public interface TrendsMapper {
	// 查看所有行业动态总数
	int countAllTrends(@Param("name") String name, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("steId") Integer steId, @Param("state") Integer state);

	// 分页查看所有行业动态
	List<Trends> showAllTrends(RowBounds rb, @Param("name") String name, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("steId") Integer steId, @Param("state") Integer state);

	// 查看动态名是否重复
	int checkTrendsName(@Param("name") String name);

	// 发布行业动态
	int createTrends(@Param("name") String name, @Param("steId") Integer steId, @Param("link") String link);

	// 修改行业动态
	int updateTrends(@Param("id") Integer id, @Param("name") String name, @Param("link") String link,
			@Param("steId") Integer steId);

	// 查看修改行业动态时动态名是否重复
	int checkUpdateName(@Param("id") Integer id, @Param("name") String name);

	// 删除行业动态
	int delTrends(@Param("id") Integer id);

	// 上线行业动态
	int uplineTrends(@Param("id") Integer id);

	// 下线行业动态
	int downlineTrends(@Param("id") Integer id);
}
