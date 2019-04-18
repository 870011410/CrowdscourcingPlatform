package org.crowd.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Log;
import org.crowd.model.Trends;
import org.crowd.service.LogSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : LogController
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
 * @date : 2018年12月8日 上午11:43:29
 * 
 * @version : 12.0.0
 */

@Controller
public class LogController {

	@Autowired
	private LogSerivce ls;

	private JSONObject outJson = new JSONObject();

	// 显示所有日志
	@RequestMapping("/do-showLogs.action")
	@ResponseBody
	public JSONObject doShowTrends(String check_time_from, String check_time_to, String check_name, Integer start,
			Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = ls.countLog(check_time_from, check_time_to, check_name);
		List<Log> logs = ls.showLogs(rb, check_time_from, check_time_to, check_name);

		// 用json
		outJson.put("logs", logs);
		outJson.put("count", count);
		return outJson;
	}

}
