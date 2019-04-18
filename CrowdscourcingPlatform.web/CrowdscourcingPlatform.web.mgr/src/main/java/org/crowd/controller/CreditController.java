package org.crowd.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.dto.UserDto;
import org.crowd.service.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * <p>
 * Title : CreditController
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
 * @date : 2018年12月9日 下午5:14:16
 * 
 * @version : 12.0.0
 */

@Controller
public class CreditController {

	@Autowired
	private CreditService cs;

	private JSONObject outJson = new JSONObject();

	// 显示所有行业动态
	@RequestMapping("/do-showCredits.action")
	@ResponseBody
	public JSONObject doShowCredits(String check_name, String check_orderBy, Integer check_type, Integer start,
			Integer limit) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = cs.countAllCredits(check_name, check_orderBy, check_type);
		List<UserDto> users = cs.showAllCredits(rb, check_name, check_orderBy, check_type);
		// 用json
		outJson.put("users", users);
		outJson.put("count", count);
		return outJson;
	}

	// 修改行业动态
	@RequestMapping("/do-updateCredit.action")
	@ResponseBody
	public JSONObject doUpdateCredit(Integer select_id, String name, String admName, Integer credit) {
		try {
			cs.updateCredit(select_id, name, credit, admName);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	public JSONObject getOutJson() {
		return outJson;
	}

	public void setOutJson(JSONObject outJson) {
		this.outJson = outJson;
	}

}
