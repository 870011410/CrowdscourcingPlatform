package org.crowd.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Linker;
import org.crowd.model.Story;
import org.crowd.model.Trends;
import org.crowd.service.LinkerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;



@Controller
public class LinkerController {

	@Autowired
	private LinkerService ls;

	private JSONObject outJson = new JSONObject();

	// 显示所有友情链接
	@RequestMapping("initLinker.action")
	@ResponseBody
	public JSONObject initLinker() {
		

		List<Linker> linker = ls.initLinker();
		// 用json
		outJson.put("linker", linker);
		
		return outJson;
	}

	

}
