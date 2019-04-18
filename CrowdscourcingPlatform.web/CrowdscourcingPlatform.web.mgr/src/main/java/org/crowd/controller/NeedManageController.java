package org.crowd.controller;
/**
 * 
     * <p>Title : NeedManageController</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月7日 上午11:33:28
     * @version : 12.0.0
 */
//需求管理的controller

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.Admin;
import org.crowd.service.NeedManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class NeedManageController {

	// 需求管理的事务
	@Autowired
	private NeedManageService needServ;

	// 需求管理的表格数据页码
	@RequestMapping("initNeed.action")
	@ResponseBody
	public JSONObject initNeed(Integer start, Integer limit,
			String title,String name,Integer needId,String sTime,String eTime) {

		// 分页
		RowBounds rb = new RowBounds(start, limit);
		JSONObject data = needServ.selctNeedMeg(title, name, needId, sTime, eTime, rb);
		
		return data;
	}
	//修改需求的状态
	
	@RequestMapping("updateNeedState.action")
	@ResponseBody
	public JSONObject updateNeedState(Integer needId,HttpServletRequest request,String ctrlName,Integer state) {
		JSONObject data = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String admName=admin.getName();

		Integer res = 0;
		try {
			res = needServ.updateNeedState(needId, state, ctrlName, admName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			res = 0;
		}
		if(res==0) {
			data.put("res","操作失败！");
		}else {
			data.put("res","操作成功！");
		}
		return data;
		
	}
	
	
	
	
	
	
}
