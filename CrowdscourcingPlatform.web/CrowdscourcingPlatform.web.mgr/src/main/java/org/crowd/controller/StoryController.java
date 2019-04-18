package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.Story;
import org.crowd.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 *<p>Title : StoryController</p>
 * <p>Description :</p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Windows10</p>
 * <p>Company : org.wf</p>
 * @author : WuFan
 * @date : 2018年12月7日 下午2:15:00
 * @version : 12.0.0
 */
@Controller
public class StoryController {

	@Autowired
	private StoryService ss;

	private JSONObject outJson = new JSONObject();

	// 显示所有故事
	@RequestMapping("/do-showStorys.action")
	@ResponseBody
	public JSONObject doShowStorys(String check_time_from, String check_time_to, String check_title,
			String check_use_name, Integer check_state, Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = ss.countAllStorys(check_title, check_time_from, check_time_to, check_use_name, check_state);
		List<Story> storys = ss.showAllStorys(rb, check_title, check_time_from, check_time_to, check_use_name,
				check_state);

		// 用json
		outJson.put("storys", storys);
		outJson.put("count", count);
		return outJson;
	}

	// 发布故事
	@RequestMapping("/do-createStory.action")
	@ResponseBody
	public JSONObject doCreateStory(String useAcc, String title, String content, HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		// 查看是否存在该雇主
		Integer useId = ss.checkUser(useAcc);
		if (useId == null) {
			outJson.put("type", "userExist");
			return outJson;
		}
		// 查看该雇主是否发布过故事
		int i = ss.checkUserStory(useId);
		if (i > 0) {
			// 发布过不能再发布
			outJson.put("type", "userStoryExist");
			return outJson;
		}
		// 查看该故事标题是否已存在
		int j = ss.checkStoryTitle(title);
		if (j > 0) {
			// 标题重复不能发布
			outJson.put("type", "titleExist");
			return outJson;
		}

		try {
			ss.createStory(title, useId, content, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 修改故事
	@RequestMapping("/do-updateStory.action")
	@ResponseBody
	public JSONObject doUpdateStory(Integer select_id, String title, HttpServletRequest request, String content) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		// 判断标题是否重复
		int i = ss.checkUpdateTitle(select_id, title);
		if (i > 0) {
			// 用json
			outJson.put("type", "titleExist");
			return outJson;
		}
		try {
			ss.updateStory(select_id, admName, title, content);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 删除故事
	@RequestMapping("/do-delStory.action")
	@ResponseBody
	public JSONObject doDelStory(Integer select_id, String select_title, HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ss.delStory(select_id, admName, select_title);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 置顶故事
	@RequestMapping("/do-stickStory.action")
	@ResponseBody
	public JSONObject doStickStory(Integer select_id, String select_title, HttpServletRequest request, Integer select_rank) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			int i = ss.stickStory(select_id, admName, select_title, select_rank);
			// 已经是第一个了
			if (i < 0) {
				// 用json
				outJson.put("type", "alredyStick");
				return outJson;
			}
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 上线故事
	@RequestMapping("/do-uplineStory.action")
	@ResponseBody
	public JSONObject doUplineStory(Integer select_id, String select_title, HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ss.uplineStory(select_id, admName, select_title);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 下线故事
	@RequestMapping("/do-downlineStory.action")
	@ResponseBody
	public JSONObject doDownlineStory(Integer select_id, String select_title, HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		try {
			ss.downlineStory(select_id, admName, select_title);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	public JSONObject getOutJson() {
		return outJson;
	}

	public void setOutJson(JSONObject outJson) {
		this.outJson = outJson;
	}

}
