package org.crowd.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.intercepter.XssRequestIntercepter;
import org.crowd.model.User;
import org.crowd.service.WorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

@Controller
public class WorksController {

	@Autowired
	private WorksService worksService;// 作品事务的接口
	// ----------------------------------------------------------作品发布的界面操作

	@RequestMapping("upWorks.action")
	@ResponseBody
	public JSONObject upWorks(HttpServletRequest request, String title, String content, String money,Integer worktypeId, MultipartFile file,Boolean check) throws IllegalStateException, IOException {
		
		JSONObject data = new JSONObject();
		XssRequestIntercepter xssRequest = new XssRequestIntercepter((HttpServletRequest) request);
		title = xssRequest.getParameter("title");
		
		if (file == null) {
			data.put("type", "上传文件不能为空！");
			return data;
		}
		
		String myFileFileName = file.getOriginalFilename();
		
		if (title.equals("")) {
			data.put("type", "作品的标题不能为空！");
			return data;
		}
		if (content.equals("")) {
			data.put("type", "作品的内容不能为空！");
			return data;
		}

		if (money.equals("")) {
			data.put("type", "作品金额不能为空！");
			return data;
		}
		Double money_num=0.0;
		try {
			money_num=Double.parseDouble(money);
		} catch (NumberFormatException e1) {
			data.put("type", "作品金额输入有误");
			return data;
		}
		if(money_num<=0) {
			data.put("type", "作品金额非法！");
			return data;
		}
		if(!check) {
			data.put("type", "请同意一站式服务规则！");
			return data;
		}
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		File myfile=new File(rootPath + "WEB-INF/upImg");
		if(!myfile.exists()){
			myfile.mkdir();
		}	
		File targetFile = new File(rootPath + "WEB-INF/upImg", myFileFileName);
		file.transferTo(targetFile); // 保存文件
		User user = (User) request.getSession().getAttribute("user");
		int index = 0;
		try {
			
			index = worksService.upWorks(title, content, "upImg/"+myFileFileName, money_num, worktypeId, user.getId(), "发布了作品", "测试用户");
			
		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index == 1) {
			data.put("type", "SUC");
		}
		return data;
	
	}
	@RequestMapping("motifyWorkImg.action")
	@ResponseBody
	public JSONObject motifyWorkImg(HttpServletRequest request,MultipartFile file) throws IllegalStateException, IOException {
		
		JSONObject data = new JSONObject();
		
		if (file == null) {
			data.put("type", "上传文件不能为空！");
			return data;
		}
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		File myfile=new File(rootPath + "WEB-INF/upImg");
		if(!myfile.exists()){
			myfile.mkdir();
		}	
		String myFileFileName = new Date().getTime()+""+file.getOriginalFilename();
		
		
		File targetFile = new File(rootPath + "WEB-INF/upImg", myFileFileName);
		file.transferTo(targetFile); // 保存文件
		
		data.put("src", "upImg/"+myFileFileName);
		
		return data;
	
	}
	@RequestMapping("/test.action")
	@ResponseBody
	public JSONObject test(HttpServletRequest request,MultipartFile file) throws IllegalStateException, IOException {
		JSONObject data = new JSONObject();
		
		if (file == null) {
			data.put("type", "上传文件不能为空！");
			return data;
		}
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		File myfile=new File(rootPath + "WEB-INF/upImg");
		if(!myfile.exists()){
			myfile.mkdir();
		}	
		String myFileFileName = file.getOriginalFilename();
		File targetFile = new File(rootPath + "WEB-INF/upImg", myFileFileName);
		file.transferTo(targetFile); // 保存文件

		data.put("code", 0);
		data.put("data", "upImg/"+myFileFileName);
		
		return data;
	
	}
}
