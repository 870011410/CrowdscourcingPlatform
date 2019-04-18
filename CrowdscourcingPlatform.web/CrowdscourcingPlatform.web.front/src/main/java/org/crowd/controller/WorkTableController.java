package org.crowd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.crowd.model.User;
import org.crowd.model.dto.NeedDeti;
import org.crowd.model.dto.WorkDto;
import org.crowd.service.UserService;
import org.crowd.service.WorkTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>
 * Title : WorkTableController
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
 * @date : 2018年12月13日 下午3:04:34
 * @version : 12.0.0
 */

//工作台的controller
@Controller
public class WorkTableController {

	@Autowired
	private WorkTableService workTableService;// 工作台事务
	// 工作台显示自己正在发布中的需求
	@Autowired
	private UserService userService;

	@RequestMapping("showMyselfNeeding.action")
	@ResponseBody
	public JSONObject showMyselfNeeding(HttpServletRequest request, Integer start, Integer limit, Integer type) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		List<NeedDeti> needs = workTableService.showMyselfNeeding(user.getId(), start, limit, type);
		Integer count = workTableService.showMyselfNeedingCount(user.getId(), type);
		data.put("count", count);
		data.put("needs", needs);
		return data;
	}

	// 雇主确定服务商完成项目(交项目付钱)
	@RequestMapping("deliverSingle.action")
	@ResponseBody
	public JSONObject deliverSingle(HttpServletRequest request, Integer bidId, Integer bidUserId, Double money,
			Integer needId) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 完成需求
		String res = "";
		try {
			res = workTableService.deliverSingle(bidId, bidUserId, money, user, needId);
			if(!res.equals("noMoney")) {
			user.setMoney(user.getMoney() - money);
			request.getSession().setAttribute("user", user);
			data.put("money",user.getMoney());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println(e);
			res = "fail";
		}

		data.put("res", res);
		return data;
	}

	// 雇主删除需求（流标）
	@RequestMapping("deleteNeed.action")
	@ResponseBody
	public JSONObject deleteNeed(HttpServletRequest request, Integer needId) {
		JSONObject data = new JSONObject();
		// 判断这个需求是否有人投标
		User user = (User) request.getSession().getAttribute("user");
		Integer index = workTableService.checkNeedIsBid(needId);
		// 是否要扣信用分 0不扣 1扣
		Integer type = 0;
		if (index > 0) {
			type = 1;
		}
		// 开始删除需求
		try {
			workTableService.deleteNeed(user, needId, type, 20);
			data.put("res", "suc");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			data.put("res", "fail");
		}
		data.put("type", type);
		return data;
	}

	// 查看自己的投标信息

	@RequestMapping("showMyselfBiding.action")
	@ResponseBody
	public JSONObject showMyselfBiding(HttpServletRequest request, Integer start, Integer limit, Integer type,
			Integer state, Integer nState) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		RowBounds rb = new RowBounds(start, limit);
		List<NeedDeti> needs = workTableService.showMyselfBiding(user.getId(), type, rb, state, nState);
		Integer count = workTableService.showMyselfBidingCount(user.getId(), type, state, nState);
		data.put("count", count);
		data.put("needs", needs);
		return data;
	}

	// 取消投标
	@RequestMapping("delMyselfBided.action")
	@ResponseBody
	public JSONObject delMyselfBided(HttpServletRequest request, Integer bidId) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 取消投标
		try {
			workTableService.deleteMyselfBid(bidId, user.getName());
			data.put("res", "suc");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			data.put("res", "fail");
		}
		return data;
	}

	// 查询我的作品
	@RequestMapping("initMyWork.action")
	@ResponseBody
	public JSONObject initMyWork(HttpServletRequest request, Integer start, Integer limit) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject data = workTableService.initMyWork(start, limit, user.getId());
		return data;
	}

	// ----------------------------------------------------------作品的上架与下架
	@RequestMapping("updateState.action")
	@ResponseBody
	public JSONObject updateState(HttpServletRequest request, Integer workId, String stateName, Integer state) {
		JSONObject data = new JSONObject();
		String content = stateName + "ID为" + workId + "作品";
		User user = (User) request.getSession().getAttribute("user");
		int index1 = 0;
		try {
			index1 = workTableService.updateState(workId, state, content, user.getName());

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index1 == 1) {
			data.put("type", "SUC");
		}
		return data;
	}

	// ----------------------------------------------------------修改作品
	@RequestMapping("motifyMyWork.action")
	@ResponseBody
	public JSONObject motifyMyWork(HttpServletRequest request, Integer workId, String title, Double money,
			Integer typeId, String content, String img) {
		JSONObject data = new JSONObject();
		String logContent = "修改了ID为" + workId + "作品";
		User user = (User) request.getSession().getAttribute("user");
		int index1 = 0;
		try {
			index1 = workTableService.motifyMyWork(workId, title, money, typeId, content, img, logContent,
					user.getName());

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index1 == 1) {
			data.put("type", "SUC");
		}
		return data;
	}
	// 退款
		@RequestMapping("returnMoney.action")
		@ResponseBody
		public JSONObject returnMoney(HttpServletRequest request, Integer workId, Integer buyerId, Double workMoney) {
			JSONObject data = new JSONObject();
			
			User user = (User) request.getSession().getAttribute("user");
			// 没登入
			if (user == null) {
				data.put("type", "NotLogin");
				return data;
			}

			// 判断余额
			if (user.getMoney() < workMoney) {
				data.put("type", "余额不足！");
				return data;
			}
			String content = "向ID为" + buyerId + "的客户退款"+workMoney+"元";
			int index = 0;
			try {

				index = workTableService.returnMoney(workId,buyerId,workMoney, content, user.getName());
				// 存到session
				HttpSession session = request.getSession();
				session.setAttribute("user", userService.afterUpdate(user.getId()));
				
			} catch (Exception e) {
				data.put("type", e.getMessage());
				return data;
			}
			if (index == 1) {
				data.put("type", "SUC");
			}
			return data;
		}

	// 查询购买的作品
	@RequestMapping("initBuyerWork.action")
	@ResponseBody
	public JSONObject initBuyerWork(HttpServletRequest request, Integer start, Integer limit) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject data = workTableService.initBuyerWork(start, limit, user.getId());
		return data;
	}
	//购买的商品确认收货
	@RequestMapping("okBuy.action")
	@ResponseBody
	public JSONObject okBuy(HttpServletRequest request, Integer workId) {
		JSONObject data = new JSONObject();
		String content = "确认收货 ID为" + workId + "作品";
		User user = (User) request.getSession().getAttribute("user");
		int index1 = 0;
		try {
			index1 = workTableService.okBuy(workId ,content, user.getName());

		} catch (Exception e) {
			data.put("type", e.getMessage());
			return data;
		}
		if (index1 == 1) {
			data.put("type", "SUC");
		}
		return data;
	}
	//服务商完成后交付文件
	@RequestMapping("uploadNeedFile.action")
	@ResponseBody
	public JSONObject uploadNeedFile(HttpServletRequest request,Integer needId, MultipartFile file) throws IllegalStateException, IOException {
		
		JSONObject data = new JSONObject();
		
		if (file == null) {
			data.put("type", "上传文件不能为空！");
			return data;
		}
		System.err.println(file.getOriginalFilename());
		String myFileFileName = file.getOriginalFilename();
		//不是rar不能上传
		if(!myFileFileName.toLowerCase().endsWith(".rar")) {
			data.put("type", "上传的文件类型必须为rar格式！");
			return data;
		}
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		File myfile=new File(rootPath + "WEB-INF/uploadFile");
		if(!myfile.exists()){
			myfile.mkdir();
		}	
		File targetFile = new File(rootPath + "WEB-INF/uploadFile", myFileFileName);
		file.transferTo(targetFile); // 保存文件
		User user = (User) request.getSession().getAttribute("user");
			
		//修改需求的文件src
		try {
			workTableService.updateNeedSrc(needId, "uploadFile/"+myFileFileName, user.getName());
		    data.put("type","文件上传成功！等待雇主接收！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			data.put("type","文件上传失败！");
		}
			/*index = worksService.upWorks(title, content, "upImg/"+myFileFileName, money_num, worktypeId, user.getId(), "发布了作品", "测试用户");*/
			
		
		return data;
	
	}
	//需求完成付钱给联盟
	
	@RequestMapping("deliverLeagure.action")
	@ResponseBody
	public JSONObject deliverLeagure(HttpServletRequest request, Integer bidId, Integer leaId, Double money,
			Integer needId) {
		JSONObject data = new JSONObject();
		User user = (User) request.getSession().getAttribute("user");
		// 完成需求
		String res = "";
		try {
			res = workTableService.deliverLeague(bidId, leaId, money, user, needId);
			if(!res.equals("noMoney")) {
			user.setMoney(user.getMoney() - money);
			request.getSession().setAttribute("user", user);
			data.put("money",user.getMoney());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println(e);
			res = "fail";
		}

		data.put("res", res);
		return data;
	}
	
	//卖家提交作品文件
		@RequestMapping("uploadWorkFile.action")
		@ResponseBody
		public JSONObject uploadWorkFile(HttpServletRequest request,Integer workId, MultipartFile file) throws IllegalStateException, IOException {
			
			JSONObject data = new JSONObject();
			
			if (file == null) {
				data.put("type", "上传文件不能为空！");
				return data;
			}
			
			String myFileFileName = file.getOriginalFilename();
			//不是rar不能上传
			if(!myFileFileName.toLowerCase().endsWith(".rar")) {
				data.put("type", "上传的文件类型必须为rar格式！");
				return data;
			}
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			File myfile=new File(rootPath + "WEB-INF/upWorkFile");
			if(!myfile.exists()){
				myfile.mkdir();
			}	
			File targetFile = new File(rootPath + "WEB-INF/upWorkFile", myFileFileName);
			file.transferTo(targetFile); // 保存文件
			User user = (User) request.getSession().getAttribute("user");
				
			//修改需求的文件src
			try {
				workTableService.updateWorkSrc(workId, "upWorkFile/"+myFileFileName, user.getName());
			    data.put("type","文件上传成功！等待买家接收！");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				data.put("type","文件上传失败！");
			}
				/*index = worksService.upWorks(title, content, "upImg/"+myFileFileName, money_num, worktypeId, user.getId(), "发布了作品", "测试用户");*/
				
			
			return data;
		
		}
}
