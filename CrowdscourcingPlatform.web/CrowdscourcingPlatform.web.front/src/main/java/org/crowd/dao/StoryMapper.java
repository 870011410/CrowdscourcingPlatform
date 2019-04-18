package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Story;

/**
 * 
 * 
 * <p>
 * Title : StoryMapper
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
 * @date : 2018年12月20日 上午10:25:44
 * 
 * @version : 12.0.0
 */
public interface StoryMapper {
	// 查看所有故事总数
	int countAllStorys();

	// 分页查看所有故事
	List<Story> showAllStorys(RowBounds rb);

}
