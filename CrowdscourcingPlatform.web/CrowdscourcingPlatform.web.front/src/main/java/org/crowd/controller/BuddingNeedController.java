package org.crowd.controller;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.LeaModel;
import org.crowd.model.User;
import org.crowd.model.dto.LeaMange;
import org.crowd.model.dto.TenderMegTableDto;
import org.crowd.service.BuddingNeedService;
import org.crowd.service.ShowNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
/**
 * 
     * <p>Title : BuddingNeedController</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : macOS Sierra 10.12.1</p>
     * <p>Company : org.crowds</p>
     * @author : zhengjiawei
     * @date : 2018年12月12日 下午1:54:56
     * @version : 12.0.0
 */
//竞标的controller
@Controller
public class BuddingNeedController {

	//投标的事务
	@Autowired
	private BuddingNeedService buddingNeedServ;
	
	@Autowired
	private ShowNeedService showtNeedServ;
	
	//判断这个人是否有竞标资格zjw
		@RequestMapping("buddingNeedFirst.action")
		@ResponseBody
		public JSONObject buddingNeedFirst(HttpServletRequest request,Integer needId,String userName,String needTitle) {
			
			JSONObject data = new JSONObject();
			User user = (User) request.getSession().getAttribute("user");
			
			if(user==null) {
				//没登入
				data.put("res","NotLogin");
			}else {
				//是自己的需求
				if(user.getName().equals(userName)) {
					data.put("res","IsMyself");
				}else {
			if(user.getType()==0) {
				//是雇主没有资格投标
				data.put("res","NotEligible");
			}else if(user.getType()==2) {
				//服务没有类型要选择类型
				data.put("res","NotType");
			}else {
				//判断下是否是盟主
				LeaMange lea =buddingNeedServ.checkUserIsLeaMan(user.getId());
				if(lea!=null) {
					//是盟主
					request.getSession().setAttribute("leaMegBuding", lea);
					request.getSession().setAttribute("needIdBudding", needId);
					request.getSession().setAttribute("needTitleBudding", needTitle);
					data.put("res","isLeaMaster");
				}else {
					//不是盟主
					//判断服务商是否投标过了
					Integer index =buddingNeedServ.checkIsBuddingSingle(user.getId(), needId);
					if(index>0) {
						//投过这个标了
						data.put("res","budded");
					}else {
						//没投过
						data.put("res", "isServer");
						request.getSession().setAttribute("needIdBudding", needId);
						request.getSession().setAttribute("needTitleBudding", needTitle);
					}
					
				}
			
			}
				}
			
			}
			return data;
		}
		
		//判断服务商个人有没有投过标了		
		@RequestMapping("checkSingleTender.action")
		@ResponseBody
		public JSONObject checkSingleTender(HttpServletRequest request) {
			JSONObject data = new JSONObject();
			User user = (User) request.getSession().getAttribute("user");
			Integer needId = (Integer) request.getSession().getAttribute("needIdBudding");
			//检查是否投标过了
			Integer index = buddingNeedServ.checkIsBuddingSingle(user.getId(), needId);
			if(index>0) {
				data.put("res","budded");
			}else {
				data.put("res","ok");
			}
			return data;
		}
	    //服务商个人投标zjw	
		@RequestMapping("buddingTenderSingle.action")
		@ResponseBody
		public JSONObject buddingTenderSingle(HttpServletRequest request,Integer needId,String content) {

			JSONObject data = new JSONObject();
			User user =(User) request.getSession().getAttribute("user");
			//检查是否是自己的标
			Integer index1 = buddingNeedServ.checkIsMyselfNeed(user.getId(), needId);
			if(index1<=0) {
			//检查是否投标过了
			Integer index = buddingNeedServ.checkIsBuddingSingle(user.getId(), needId);
			if(index<=0) {
			//进行投标
			try {
				buddingNeedServ.buddingTenderSingle(needId, user.getId(), content,user.getName());
				data.put("res","yes");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				data.put("res","no");
			}
			}else {
				data.put("res","isBudded");
			}
			}else {
				data.put("res","isMyselef");
			}
			return data;
		}
		
		//判断联盟是否投标过了		
		@RequestMapping("checkLeagureTender.action")
		@ResponseBody
		public JSONObject checkLeagureTender(HttpServletRequest request) {
			JSONObject data = new JSONObject();
			LeaModel lea = (LeaModel) request.getSession().getAttribute("leaMegBuding");
			Integer needId = (Integer) request.getSession().getAttribute("needIdBudding");
			//检查是否投标过了
			Integer index = buddingNeedServ.checkLeagueBudding(needId, lea.getId());
			if(index>0) {
				data.put("res","budded");
			}else {
				data.put("res","ok");
			}
			return data;
		}
	
		//联盟投标		
		@RequestMapping("buddingTenderLeague.action")
		@ResponseBody
		public JSONObject buddingTenderLeague(HttpServletRequest request,Integer needId,String content,Integer leaId) {

			JSONObject data = new JSONObject();
			User user = (User) request.getSession().getAttribute("user");
			//检查是否投标过了
			Integer index = buddingNeedServ.checkLeagueBudding(needId, leaId);
			if(index<=0) {
			//进行投标
			try {
				buddingNeedServ.buddingTenderLeague(needId, content, leaId, user.getName());
				data.put("res","yes");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				data.put("res","no");
			}
			}else {
				data.put("res","isBudded");
			}
			
			return data;
		}
		
		
		//显示投标联盟的投标信息
		@RequestMapping("showThisBidderLeagueMeg.action")
		@ResponseBody
		public JSONObject showThisBidderLeagueMeg(HttpServletRequest request,Integer leaId,Integer bidId,String userName) {
			
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
			TenderMegTableDto tender = showtNeedServ.showThisBidderLeague(bidId);
			data.put("tender", tender);
			return data;
		}
}
