package org.crowd.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.News;
import org.crowd.model.Story;
import org.crowd.model.Trends;
import org.crowd.model.dto.BrokeRuleDto;
import org.crowd.service.BrokeRuleService;
import org.crowd.service.NewsService;
import org.crowd.service.StoryService;
import org.crowd.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * 
 * <p>
 * Title : CommunityController
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
 * @date : 2018年12月18日 下午2:39:34
 * 
 * @version : 12.0.0
 */

//社区
@Controller
public class CommunityController {

	@Autowired
	private NewsService newsService;

	@Autowired
	private TrendsService trendsService;

	@Autowired
	private StoryService storyService;
	
	@Autowired
	private BrokeRuleService brokeRuleService;

	private JSONObject outJson = new JSONObject();

	// 显示最新资讯
	@RequestMapping("/do-showNews.action")
	@ResponseBody
	public JSONObject doShowNews(Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = newsService.searchNewsCount();
		List<News> news = newsService.searchNewsInfo(rb);

		// 用json
		outJson.put("news", news);
		outJson.put("newsCount", count);
		return outJson;
	}

	// 显示行业动态
	@RequestMapping("/do-showTrends.action")
	@ResponseBody
	public JSONObject doShowTrends(Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = trendsService.countAllTrends();
		List<Trends> trends = trendsService.showAllTrends(rb);

		// 用json
		outJson.put("trends", trends);
		outJson.put("trendsCount", count);
		return outJson;
	}

	// 显示雇主故事
	@RequestMapping("/do-showStorys.action")
	@ResponseBody
	public JSONObject doShowStorys(Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = storyService.countAllStorys();
		List<Story> storys = storyService.showAllStorys(rb);

		// 用json
		outJson.put("storys", storys);
		outJson.put("storysCount", count);
		return outJson;
	}

	// 显示曝光台
	@RequestMapping("/do-showBrokerules.action")
	@ResponseBody
	public JSONObject doShowBrokerules(Integer start, Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = brokeRuleService.initBrokeRuleCount();
		List<BrokeRuleDto> brokerules = brokeRuleService.initBrokeRule(rb);

		// 用json
		outJson.put("brokerules",brokerules);
		outJson.put("brokerulesCount", count);
		return outJson;
	}
}
