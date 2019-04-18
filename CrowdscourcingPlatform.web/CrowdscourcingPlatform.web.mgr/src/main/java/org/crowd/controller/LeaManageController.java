package org.crowd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.Admin;
import org.crowd.model.User;
import org.crowd.service.LeaManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * <p>Title : LeaManageController</p>
 * <p>Description :</p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : window 7</p>
 * <p>Company : org.crowd</p>
 * @author : zhengjiawei
 * @date : 2018年12月8日 上午9:30:53
 * @version : 12.0.0
 */
//联盟管理的controller
@Controller
public class LeaManageController {

	// 联盟管理的事务
	@Autowired
	private LeaManageService leaServ;

	// 获取所有的盟主信息
	@RequestMapping("initLeaMaster.action")
	@ResponseBody
	public JSONObject initLeaMaster() {

		JSONObject data = new JSONObject();
		List<User> users = leaServ.selectLeaMaster();
		data.put("users", users);
		return data;
	}

	// 联盟数据展现（分页显示）

	@RequestMapping("initLeaMeg.action")
	@ResponseBody
	public JSONObject initLeaMeg(Integer start,Integer limit,String leaName,
			String sTime,String eTime,Integer leaMasterId) {

		JSONObject data = leaServ.selectLeaMeg(start, limit, leaName, sTime, eTime, leaMasterId);
		return data;
	}
	
	
	//改变联盟的状态(联盟审核，封杀)
	
	@RequestMapping("updateLeaState.action")
	@ResponseBody
	public JSONObject updateLeaState(HttpServletRequest request,Integer leaId,
			String ctrlMeg,Integer state ) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();
		Integer res = 0;
		try {
			 res=leaServ.updateLeaState(leaId, ctrlMeg, state, admName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			res=0;
		}
		
		data.put("res",res);
		return data;
	}

	//查看某个联盟的所有成员
	@RequestMapping("selectUserWithLea.action")
	@ResponseBody
	public JSONObject selectUserWithLea(Integer leaId) {
		JSONObject data = new JSONObject();
		List<String> users = leaServ.selectUserWithLea(leaId);
		
		data.put("users",users);
		return data;
	}
	
}
