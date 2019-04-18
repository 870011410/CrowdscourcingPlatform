package org.crowd.service.impl;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.crowd.dao.LogMapper;
import org.crowd.dao.StoryMapper;
import org.crowd.model.Story;
import org.crowd.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * <p>
 * Title : StoryServiceImpl
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
 * @date : 2018年12月7日 下午2:16:44
 * 
 * @version : 12.0.0
 */
@Service
public class StoryServiceImpl implements StoryService {

	@Autowired
	private StoryMapper sm;

	@Autowired
	private LogMapper lm;

	// 查看所有故事总数
	@Override
	public int countAllStorys(String title, String time_from, String time_to, String useName, Integer state) {
		int i = sm.countAllStorys(title, time_from, time_to, useName, state);
		return i;
	}

	// 分页查看所有故事
	@Override
	public List<Story> showAllStorys(RowBounds rb, String title, String time_from, String time_to, String useName,
			Integer state) {
		List<Story> list = sm.showAllStorys(rb, title, time_from, time_to, useName, state);
		return list;
	}

	// 查看是否存在该雇主
	@Override
	public Integer checkUser(String useAcc) {
		Integer i = sm.checkUser(useAcc);
		return i;
	}

	// 查看雇主是否发布过故事
	@Override
	public int checkUserStory(Integer useId) {
		int i = sm.checkUserStory(useId);
		return i;
	}

	// 查看故事标题是否重复
	@Override
	public int checkStoryTitle(String title) {
		int i = sm.checkStoryTitle(title);
		return i;
	}

	// 发布雇主故事
	@Transactional(rollbackFor = Exception.class)
	public void createStory(String title, Integer useId, String content, String name) throws Exception {
		int a = sm.createStory(title, useId, content);

		int b = lm.createLog(name, "发布了雇主故事：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("发布失败");
		}
	}

	// 修改雇主故事
	@Transactional(rollbackFor = Exception.class)
	public void updateStory(Integer id, String name, String title, String content) throws Exception {
		int a = sm.updateStory(id, title, content);
		int b = lm.createLog(name, "修改了雇主故事：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("修改失败");
		}
	}

	// 查看修改时标题是否重复
	@Override
	public int checkUpdateTitle(Integer id, String title) {
		int i = sm.checkUpdateTitle(id, title);
		return i;
	}

	// 删除雇主故事
	@Transactional(rollbackFor = Exception.class)
	public void delStory(Integer id, String name, String title) throws Exception {
		int a = sm.delStory(id);
		int b = lm.createLog(name, "删除了雇主故事：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("删除失败");
		}
	}

	// 置顶雇主故事
	@Transactional(rollbackFor = Exception.class)
	public int stickStory(Integer id, String name, String title, Integer rank) throws Exception {

		int c = sm.beforeStick(rank);
		int a = sm.stickStory(id);
		int b = lm.createLog(name, "置顶了雇主故事：" + title);
		if (c <= 0) {
			return -1;
		} else if (a > 0 && b > 0 && c > 0) {
			return 1;
		} else {
			throw new Exception("置顶失败");
		}

	}

	// 上线雇主故事
	@Transactional(rollbackFor = Exception.class)
	public void uplineStory(Integer id, String name, String title) throws Exception {
		int a = sm.uplineStory(id);
		int b = lm.createLog(name, "上线了雇主故事：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("上线失败");
		}
	}

	// 下线雇主故事
	@Transactional(rollbackFor = Exception.class)
	public void downlineStory(Integer id, String name, String title) throws Exception {
		int a = sm.downlineStory(id);
		int b = lm.createLog(name, "下线了雇主故事：" + title);

		if (a > 0 && b > 0) {

		} else {
			throw new Exception("下线失败");
		}
	}

}
