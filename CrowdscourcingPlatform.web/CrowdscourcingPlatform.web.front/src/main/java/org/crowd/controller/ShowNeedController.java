package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.NeedTypeModel;
import org.crowd.model.User;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.TenderLeaOrUserDto;
import org.crowd.model.dto.TenderMegTableDto;
import org.crowd.service.ShowNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : ShowNeedController
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : macOS Sierra 10.12.1
 * </p>
 * <p>
 * Company : org.crowds
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月11日 上午11:35:45
 * @version : 12.0.0
 */
@Controller
public class ShowNeedController {

	// 显示需求的事务
	@Autowired
	private ShowNeedService showtNeedServ;

	// 从数据库中查处已经配置的需求类型(zjw)
	@RequestMapping("selectNeedTypeWithServ.action")
	@ResponseBody
	public JSONObject selectNeedTypeWithServ(HttpServletRequest request,Integer servId) {

		JSONObject data = new JSONObject();
		
		List<NeedTypeModel> needTypes = showtNeedServ.selectNeedTypeWithServ(servId);
		data.put("needTypes", needTypes);
		return data;
	}

	// 显示需求信息到界面上
	@RequestMapping("initShowNeed.action")
	@ResponseBody
	public JSONObject initShowNeed(Integer start, Integer limit, String title,Integer servId,Integer typeId) {

		JSONObject data = showtNeedServ.selectNeedMeg(servId, start, limit, title, typeId);
		return data;
	}
	//将需求id保存到session中
	
	@RequestMapping("saveNeedIdToSession.action")
	@ResponseBody
	public JSONObject saveNeedIdToSession(Integer needId, HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		//把needId存入session
		request.getSession().setAttribute("needIdShow", needId);
		return data;
	}
	//查看某个需求id的详细需求信息
	@RequestMapping("selectNeedDetiWithNeedId.action")
	@ResponseBody
	public JSONObject selectNeedDetiWithNeedId(HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		//拿到需求id
		Integer needId = (Integer) request.getSession().getAttribute("needIdShow");
		NeedDeti needDeti = showtNeedServ.selectNeedMegWithNeedId(needId);
		data.put("needDeti", needDeti);
		return data;
	}
	//显示某个需求的投标服务商和联盟	
	@RequestMapping("showTenderPeopleWithNeedId.action")
	@ResponseBody
	public JSONObject showTenderPeopleWithNeedId(HttpServletRequest request) {
		
		JSONObject data = new JSONObject();
		//拿到需求id
		Integer needId = (Integer) request.getSession().getAttribute("needIdShow");
		List<TenderLeaOrUserDto> tenders = showtNeedServ.showTenderPeopleWithNeedId(needId);
		System.err.println("lai");
		data.put("tenders", tenders);
		return data;
	}
	//显示某个服务商的投标信息
	
	@RequestMapping("showThisBidderMeg.action")
	@ResponseBody
	public JSONObject showThisBidderMeg(HttpServletRequest request,
			Integer userId,Integer bidId,String userName) {
		
		JSONObject data = new JSONObject();
		//拿到session值
		User user = (User) request.getSession().getAttribute("user");
		if(user==null) {
			//没登入的
			data.put("res","No");
		}else {
			if(user.getName().equals(userName)) {
				//不是雇主本人
				data.put("res","Yes");
			}else {
				//是雇主本人
				data.put("res","No");
			}
		}
		//查询该投标信息
		TenderMegTableDto tender = showtNeedServ.showThisBidderMeg(bidId);
		data.put("tender", tender);
		return data;
	}
	//与某个服务商合作	
		@RequestMapping("joinWorkWithServer.action")
		@ResponseBody
		public JSONObject joinWorkWithServer(HttpServletRequest request,
				Integer bidId,String bidUser) {
			
			JSONObject data = new JSONObject();
			//拿到用户session
			User user = (User) request.getSession().getAttribute("user");
			Integer needId = (Integer) request.getSession().getAttribute("needIdShow");
			try {
				Integer index = showtNeedServ.joinWorkWithServer(bidId, bidUser, user.getName(), needId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				data.put("res","fail");
				return data;
			}
			request.getSession().setAttribute("needIdShow",null);
            data.put("res","suc");
			return data;
		}
	//显示众包平台的数据
		
		@RequestMapping("showCrowData.action")
		@ResponseBody
		public JSONObject showCrowData() {
			
			JSONObject data = new JSONObject();
			  data = showtNeedServ.showCrowdData();
			return data;
		}
		
}
