package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Linker;
import org.crowd.model.Story;
import org.crowd.model.Trends;

/**
 * 
 * <p>
 * Title : LinkerService
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
 * @date : 2018年12月8日 下午2:32:32
 * 
 * @version : 12.0.0
 */
public interface LinkerService {
	// 查看所有友情链接总数
	int countAllLinkers(@Param("name") String name, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("state") Integer state);

	// 分页查看所有友情链接
	List<Linker> showAllLinkers(RowBounds rb, @Param("name") String name, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("state") Integer state);

	// 查看链接名是否重复
	int checkLinkerName(@Param("name") String name);

	// 发布友情链接
	void createLinker(@Param("name") String name, @Param("link") String link, @Param("admName") String admName) throws Exception;

	// 修改友情链接
	void updateLinker(@Param("id") Integer id, @Param("name") String name, @Param("link") String link,
			@Param("admName") String admName) throws Exception;

	// 查看修改友情链接时动态名是否重复
	int checkUpdateName(@Param("id") Integer id, @Param("name") String name);

	// 删除友情链接
	void delLinker(@Param("id") Integer id, @Param("admName") String admName, @Param("name") String name) throws Exception;

	// 上线友情链接
	void uplineLinker(@Param("id") Integer id, @Param("admName") String admName, @Param("name") String name) throws Exception;

	// 下线友情链接
	void downlineLinker(@Param("id") Integer id, @Param("admName") String admName, @Param("name") String name) throws Exception;
}
