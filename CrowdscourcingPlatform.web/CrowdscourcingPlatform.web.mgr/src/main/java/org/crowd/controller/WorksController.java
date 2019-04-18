package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.model.User;
import org.crowd.model.dto.WorkDto;
import org.crowd.service.UserService;
import org.crowd.service.WorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class WorksController {
	@Autowired
	WorksService worksService;// 作品管理的事务接口

	// ----------------------------------------------------------作品管理数据初始化

	@RequestMapping("/initWork.action")
	@ResponseBody
	public JSONObject initWork(String begin, String end, String name,Integer state, Integer start, Integer limit) {

		RowBounds rb = new RowBounds(start, limit);
		
		List<WorkDto> workDtos = worksService.initWork(begin, end, name, state, rb);
		Integer count = worksService.initWorkCount(begin, end, name, state);
		JSONObject data = new JSONObject();
		data.put("workDtos", workDtos);
		data.put("count", count);
		return data;
	}
	
	// ----------------------------------------------------------作品的上架与下架
		@RequestMapping("/motifyWorkState.action")
		@ResponseBody
		public JSONObject motifyWorkState(Integer workId, String uname, Integer state,HttpServletRequest request) {
			JSONObject data = new JSONObject();
			
			String content =state==1? "用户" + uname + "的作品审核通过":"用户" + uname + "的作品审核不通过";
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			String admName=admin.getName();
			int index1 = 0;
			try {
				index1 = worksService.motifyWorkState(workId, state, content, admName);

			} catch (Exception e) {
				data.put("type", e.getMessage());
				return data;
			}
			if (index1 == 1) {
				data.put("type", "SUC");
			}
			return data;
		}
}
