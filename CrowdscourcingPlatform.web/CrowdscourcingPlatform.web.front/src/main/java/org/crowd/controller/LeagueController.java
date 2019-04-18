package org.crowd.controller;

import java.io.ObjectOutputStream.PutField;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.User;
import org.crowd.model.dto.LeaMange;
import org.crowd.model.dto.LeaUserLinkDto;
import org.crowd.model.dto.NeedDeti;
import org.crowd.service.WorkTableService;
import org.crowd.service.impl.LeagueServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : LeagueController
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
 * @date : 2018年12月17日 上午10:39:06
 * @version : 12.0.0
 */
//联盟中心controller
@Controller
public class LeagueController {
//联盟中心事务
	@Autowired
	private LeagueServiceImpl leagueServiceImpl;
	@Autowired
	private WorkTableService workTableService;// 工作台事务

	// 新增联盟
	@RequestMapping("newLeagure.action")
	@ResponseBody
	public JSONObject newLeagure(HttpServletRequest request, String leaName, String content, String src) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 参数验证
		if (leaName.equals("") || content.equals("") || src.equals("")) {
			data.put("res", "illegal");
			return data;
		}
		// 验证是否是雇主
		if (user.getType() == 0) {
			data.put("res", "typeiszero");
			return data;
		}
		// 验证用户是否加入过联盟（盟主和成员）
		Boolean index = leagueServiceImpl.checkUserLeague(user.getId());
		if (index == true) {
			data.put("res", "added");
			return data;
		}
		// 验证联盟名字是否重复
		Integer index2 = leagueServiceImpl.checkLeaNameIsReapet(leaName);
		if (index2 > 0) {
			data.put("res", "reapet");
			return data;
		}
		// 开始添加
		try {
			Integer index1 = leagueServiceImpl.createNewLeague(leaName, user.getId(), content, src, user.getName());
			data.put("res", "suc");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			data.put("res", "fail");
		}
		return data;
	}

	
	//检查是否有联盟（联盟申请中也算）	
	@RequestMapping("checkHaveLeague.action")
	@ResponseBody
	public JSONObject checkHaveLeague(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 验证是否是雇主
		if (user.getType() == 0) {
			data.put("res", "typeiszero");
			return data;
		}
		// 验证用户是否加入过联盟（盟主和成员）
		Boolean index = leagueServiceImpl.checkUserLeague(user.getId());
		if (index == true) {
			data.put("res", "added");
			return data;
		}
		data.put("res", "suc");
		return data;
		
	}
	
	
	@RequestMapping("checkUserHaveLeague.action")
	@ResponseBody
	public JSONObject checkUserHaveLeague(HttpServletRequest request) {

		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 判断是否是盟主
		LeaMange leaMange = leagueServiceImpl.checkUserIsMaster(user.getId());
		// 判断是否是成员
		LeaMange leaMeg = leagueServiceImpl.checkUserAddLea(user.getId());
		if (leaMange == null) {
			if (leaMeg == null) {
				data.put("res", "no");

				return data;
			}
			
		}
		
		
		data.put("res", "ok");
		return data;
	}
	// 显示自己联盟的信息
	@RequestMapping("showMyLeaMeg.action")
	@ResponseBody
	public JSONObject showMyLeaMeg(HttpServletRequest request) {

		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 判断是否是盟主
		LeaMange leaMange = leagueServiceImpl.checkUserIsMaster(user.getId());
		if (leaMange != null) {
			// 用户是盟主
			leaMange.setUserName(user.getName());
			// 统计联盟人数
			Integer count = leagueServiceImpl.selectLeaCountWithLeaId(leaMange.getId());
			data.put("res", "isMaster");
			data.put("leaMange", leaMange);
			data.put("count", count);
			return data;
		}
		// 判断是否是成员
		LeaMange leaMeg = leagueServiceImpl.checkUserAddLea(user.getId());
		if (leaMeg != null) {
			// 是某个联盟成员
			// 统计联盟人数
			Integer count = leagueServiceImpl.selectLeaCountWithLeaId(leaMeg.getId());
			data.put("res", "isPeople");
			data.put("leaMange", leaMeg);
			data.put("count", count);

			return data;
		}
		data.put("res", "noLea");
		return data;
	}

	// 显示所有的联盟
	@RequestMapping("initAllLeagues.action")
	@ResponseBody
	public JSONObject initAllLeagues(Integer start, Integer limit) {

		JSONObject data = new JSONObject();
		// 显示所有的联盟信息
		data = leagueServiceImpl.selectLeaMeg(start, limit);
		return data;
	}

	// 申请加入联盟
	@RequestMapping("applyJoinLeague.action")
	@ResponseBody
	public JSONObject applyJoinLeague(Integer leaId, HttpServletRequest request) {

		JSONObject data = new JSONObject();
        User user = (User) request.getSession().getAttribute("user");
        if(user.getType()==0) {
        	//雇主没有资格加入
        	data.put("res","isUser");
        }else {
        	//还未审核 已审核 被封杀
        	//判断是否在创建联盟中或已是盟主
        	LeaMange leagueOne = leagueServiceImpl.checkUserIsMasterAll(user.getId());
        	if(leagueOne!=null) {
        		//已经是盟主或在成立联盟的过程中
        		data.put("res","isLeaMaster");
        	}else {
        		//是否加入了别的联盟
        		LeaMange leagueTwo = leagueServiceImpl.checkUserAddLea(user.getId());
        		if(leagueTwo!=null) {
        			//已经加入过别的联盟了
        			data.put("res","isAdded");
        		}else {
        			//判断这个联盟是否已经申请过了
        			Integer index = leagueServiceImpl.checkUserIsApplyThisLea(leaId,user.getId());
        				if(index>0) {
        					//申请过了
        					data.put("res","isApply");
        				}else {
        					//没加过可以申请
                			//申请加入联盟
                		 try {
							leagueServiceImpl.applyJoinLeague(leaId, user.getId(),user.getName());
							data.put("res","suc");
                		 } catch (Exception e) {
							// TODO Auto-generated catch block
                			 data.put("res","fail");
						}
        				}
        			
        		}
        	}
        	
        }
        
		return data;
	}

	//跳转到联盟管理界面	
	@RequestMapping("peopleMgr.action")
	@ResponseBody
	public JSONObject peopleMgr(HttpServletRequest request,Integer leaId) {

		JSONObject data = new JSONObject();
		request.getSession().setAttribute("myselefLeaId", leaId);
		return data;
	}
	//跳到联盟投标管理界面	
	@RequestMapping("leaTenderMgr.action")
	@ResponseBody
	public JSONObject leaTenderMgr(HttpServletRequest request,Integer leaId) {

		JSONObject data = new JSONObject();
		request.getSession().setAttribute("myselefLeaId", leaId);
		return data;
	}
	// 显示联盟的人员
		@RequestMapping("showMyLeaguePeople.action")
		@ResponseBody
		public JSONObject showMyLeaguePeople(HttpServletRequest request,Integer start, Integer limit,
				String check_name,Integer check_state,
				String check_time_from,String check_time_to ) {

			JSONObject data = new JSONObject();
			Integer leaId = (Integer) request.getSession().getAttribute("myselefLeaId");
			RowBounds rb = new RowBounds(start,limit);
			List<LeaUserLinkDto> leaUsers = leagueServiceImpl.selectPeopleWithLeague(rb, leaId, check_name, check_state, check_time_from, check_time_to);
			Integer count = leagueServiceImpl.selectPeopleWithLeagueCount(leaId, check_name, check_state, check_time_from, check_time_to);
			data.put("leaUsers", leaUsers);
			data.put("count", count);
			return data;
		}
	//联盟审核成员加入（同意）
		@RequestMapping("audiPassLeagueUser.action")
		@ResponseBody
		public JSONObject audiPassLeagueUser(Integer audiId,Integer userId, HttpServletRequest request) {

			JSONObject data = new JSONObject();
	        User user = (User) request.getSession().getAttribute("user");
	        
	        	//还未审核 已审核 被封杀
	        	//判断是否在创建联盟中或已是盟主
	        	LeaMange leagueOne = leagueServiceImpl.checkUserIsMasterAll(userId);
	        	if(leagueOne!=null) {
	        		//已经是盟主或在成立联盟的过程中
	        		data.put("res","isLeaMaster");
	        	}else {
	        		//是否加入了别的联盟
	        		LeaMange leagueTwo = leagueServiceImpl.checkUserAddLea(userId);
	        		if(leagueTwo!=null) {
	        			//已经加入过别的联盟了
	        			data.put("res","isAdded");
	        		}else {
	        			//加入
	        			try {
							leagueServiceImpl.updateLeagueUserState(audiId, 1,user.getName(),"同意联盟成员加入");
							data.put("res","suc");
	        			} catch (Exception e) {
							// TODO Auto-generated catch block
	        				data.put("res","fail");
						}
	        			
	        		}
	        	}
	        	
	      
	        
			return data;
		}
		//审核联盟成员（拒绝）		
		@RequestMapping("audiThrowLeagueUser.action")
		@ResponseBody
		public JSONObject audiThrowLeagueUser(Integer audiId,Integer userId, HttpServletRequest request) {

			JSONObject data = new JSONObject();
	        User user = (User) request.getSession().getAttribute("user");
	        			//拒绝
	        			try {
							leagueServiceImpl.updateLeagueUserState(audiId, 2,user.getName(),"拒绝了联盟成员加入");
							data.put("res","suc");
	        			} catch (Exception e) {
							// TODO Auto-generated catch block
	        				data.put("res","fail");
						}
 
			return data;
		}
		
		
		//剔除用户		
				@RequestMapping("deleteLeagueUser.action")
				@ResponseBody
				public JSONObject deleteLeagueUser(Integer audiId,Integer userId, HttpServletRequest request) {

					JSONObject data = new JSONObject();
			        User user = (User) request.getSession().getAttribute("user");
			        			//剔除用户
			        			try {
			        				leagueServiceImpl.deleteLeagueUser(audiId, user.getName(),"剔除了联盟成员");
									data.put("res","suc");
			        			} catch (Exception e) {
									// TODO Auto-generated catch block
			        				data.put("res","fail");
								}
		 
					return data;
				}
		
	 //查看联盟的投标情况
	@RequestMapping("showLeagureBiding.action")
	@ResponseBody
	public JSONObject showLeagureBiding(HttpServletRequest request,Integer leaId, Integer start, Integer limit, Integer type,
			Integer state, Integer nState) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		RowBounds rb = new RowBounds(start, limit);
		List<NeedDeti> needs = workTableService.showLeagureBiding(leaId, type, state, rb, nState);
		Integer count = workTableService.showLeagureBidingCount(leaId, type, state, nState);
		data.put("count", count);
		data.put("needs", needs);
		return data;
	}			
				
				
				
				
				
				
}
