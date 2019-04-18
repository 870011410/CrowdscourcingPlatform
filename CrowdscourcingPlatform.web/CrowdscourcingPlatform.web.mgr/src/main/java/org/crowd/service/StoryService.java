package org.crowd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Story;

/**
 * 
 * <p>
 * Title : StoryService
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
 * @date : 2018年12月7日 下午2:16:32
 * 
 * @version : 12.0.0
 */
public interface StoryService {
	// 查看所有故事总数
	int countAllStorys(@Param("title") String title, @Param("time_from") String time_from,
			@Param("time_to") String time_to, @Param("useName") String useName, @Param("state") Integer state);

	// 分页查看所有故事
	List<Story> showAllStorys(RowBounds rb, @Param("title") String title, @Param("time_from") String time_from,
			@Param(" time_to") String time_to, @Param("useName") String useName, @Param("state") Integer state);

	// 查看是否存在该雇主
	Integer checkUser(@Param("useAcc") String useAcc);

	// 查看雇主是否发布过故事
	int checkUserStory(@Param("useId") Integer useId);

	// 查看故事标题是否重复
	int checkStoryTitle(@Param("title") String title);

	// 发布雇主故事
	void createStory(@Param("title") String title, @Param("useId") Integer useId, @Param("content") String content,
			@Param("name") String name) throws Exception;

	// 修改雇主故事
	void updateStory(@Param("id") Integer id, @Param("name") String name, @Param("title") String title,
			@Param("content") String content) throws Exception;

	// 查看修改时标题是否重复
	int checkUpdateTitle(@Param("id") Integer id, @Param("title") String title);

	// 删除雇主故事
	void delStory(@Param("id") Integer id, @Param("name") String name, @Param("title") String title) throws Exception;

	// 置顶雇主故事
	int stickStory(@Param("id") Integer id, @Param("name") String name, @Param("title") String title,
			@Param("rank") Integer rank) throws Exception;

	// 上线雇主故事
	void uplineStory(@Param("id") Integer id, @Param("name") String name, @Param("title") String title)
			throws Exception;

	// 下线雇主故事
	void downlineStory(@Param("id") Integer id, @Param("name") String name, @Param("title") String title)
			throws Exception;
}
