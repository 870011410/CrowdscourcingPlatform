package org.crowd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Story;

/**
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
 * @date : 2018年12月7日 下午2:16:05
 * 
 * @version : 12.0.0
 */
public interface StoryMapper {
	// 查看所有故事总数
	int countAllStorys(@Param("title") String title, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("useName") String useName, @Param("state") Integer state);

	// 分页查看所有故事
	List<Story> showAllStorys(RowBounds rb, @Param("title") String title, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("useName") String useName, @Param("state") Integer state);

	// 查看是否存在该雇主
	Integer checkUser(@Param("useAcc") String useAcc);

	// 查看雇主是否发布过故事
	int checkUserStory(@Param("useId") Integer useId);

	// 查看故事标题是否重复
	int checkStoryTitle(@Param("title") String title);

	// 发布雇主故事
	int createStory(@Param("title") String title, @Param("useId") Integer useId, @Param("content") String content);

	// 修改雇主故事
	int updateStory(@Param("id") Integer id, @Param("title") String title, @Param("content") String content);

	// 查看修改故事时标题是否重复
	int checkUpdateTitle(@Param("id") Integer id, @Param("title") String title);

	// 删除雇主故事
	int delStory(@Param("id") Integer id);

	// 置顶雇主故事前先后移之前的故事
	int beforeStick(@Param("rank") Integer rank);

	// 置顶雇主故事
	int stickStory(@Param("id") Integer id);

	// 上线雇主故事
	int uplineStory(@Param("id") Integer id);

	// 下线雇主故事
	int downlineStory(@Param("id") Integer id);
}
