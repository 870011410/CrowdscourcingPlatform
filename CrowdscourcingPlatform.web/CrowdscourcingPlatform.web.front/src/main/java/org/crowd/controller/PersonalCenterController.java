package org.crowd.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.crowd.config.AlipayConfig;
import org.crowd.model.User;
import org.crowd.model.dto.AccountDetaDto;
import org.crowd.rsa.Md5;
import org.crowd.rsa.Rsa;
import org.crowd.service.AccountService;
import org.crowd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.internal.util.AlipaySignature;

/**
 * 
 * <p>
 * Title : PersonalCenterController
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
 * @date : 2018年12月11日 下午3:17:21
 * 
 * @version : 12.0.0
 */

@Controller
public class PersonalCenterController {

	@Autowired
	private UserService userService;

	@Autowired
	private AccountService accountService;

	private JSONObject outJson = new JSONObject();

	// 显示个人资料
	@RequestMapping("/do-showUserInfo.action")
	@ResponseBody
	public JSONObject doShowUserInfo(Integer id) {
		User user = userService.afterUpdate(id);
		// 用json
		outJson.put("user", user);
		return outJson;
	}

	// 修改个人信息
	@RequestMapping("/do-updateUserInfo.action")
	@ResponseBody
	public JSONObject doUpdateUserInfo(Integer select_id, String name, String content, String phone, String email,
			String src, HttpServletRequest req) {

		// 判断用户名是否重复
		int i = userService.checkUserName(select_id, name);
		if (i > 0) {
			// 用json
			outJson.put("type", "nameExist");
			return outJson;
		}

		try {
			userService.updateUserInfo(select_id, name, content, phone, email, src);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		User user = new User();
		user = userService.afterUpdate(select_id);
		// 存到session
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		System.err.println(user.getSrc());
		// 用json
		outJson.put("type", "success");
		outJson.put("user", user);
		return outJson;
	}

	// 充值
	/*
	 * @RequestMapping("/do-recharge.action")
	 * 
	 * @ResponseBody public JSONObject recharge(Integer select_id, String name,
	 * Double money, HttpServletRequest req) {
	 * 
	 * try { userService.recharge(select_id, money, name); } catch (Exception e) {
	 * // 用json outJson.put("type", "fail"); return outJson; }
	 * 
	 * User user = new User(); user = userService.afterUpdate(select_id); //
	 * 存到session HttpSession session = req.getSession();
	 * session.setAttribute("user", user); // 用json outJson.put("type", "success");
	 * outJson.put("user", user); return outJson; }
	 */
	@RequestMapping("/return_url")
	public ModelAndView return_url_jsp(HttpServletRequest request) throws Exception {

		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名

		// ——请在这里编写您的程序（以下代码仅作参考）——
		if (signVerified) {
			// 商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
			HttpSession session = request.getSession();
			String name = (String) session.getAttribute("subject");
			String body = (String) session.getAttribute("body");

			userService.recharge(Integer.parseInt(body), Double.parseDouble(total_amount), name);
			User user = new User();
			user = userService.afterUpdate(Integer.parseInt(body));

			session.setAttribute("user", user);
		} else {
			System.err.println("验签失败");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("close");
		return mv;
	}

	// 显示雇主订单信息
	@RequestMapping("/do-showBuyerAccounts.action")
	@ResponseBody
	public JSONObject doShowBuyerAccounts(Integer start, Integer limit, String check_name, String check_title,
			String check_time_from, String check_time_to, Integer useId) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);
		int count = accountService.countBuyerAccounts(check_name, check_title, check_time_from, check_time_to, useId);
		List<AccountDetaDto> accounts = accountService.showBuyerAccounts(rb, check_name, check_title, check_time_from,
				check_time_to, useId);

		// 用json
		outJson.put("accounts", accounts);
		outJson.put("count", count);
		return outJson;
		
	}

	// 显示服务商订单信息
	@RequestMapping("/do-showProviderAccounts.action")
	@ResponseBody
	public JSONObject doShowProviderAccounts(Integer start, Integer limit, String check_name, String check_title,
			String check_time_from, String check_time_to, Integer useId) {
		// 分页
		RowBounds rb = new RowBounds(start, limit);

		int count = accountService.countProviderAccounts(check_name, check_title, check_time_from, check_time_to,
				useId);
		List<AccountDetaDto> accounts = accountService.showProviderAccounts(rb, check_name, check_title,
				check_time_from, check_time_to, useId);

		// 用json
		outJson.put("accounts", accounts);
		outJson.put("count", count);
		return outJson;
	}

	// 支付
	@RequestMapping("/do-payAccount.action")
	@ResponseBody
	public JSONObject doPayAccount(Integer select_id, Double select_money, HttpServletRequest req) {

		// 从session中取user
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		// 余额不足
		if (user.getMoney() < select_money) {
			// 用json
			outJson.put("type", "notEnough");
			return outJson;
		}

		// 支付
		try {
			accountService.payAccount(user.getId(), user.getName(), select_id, select_money);
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 用json
		outJson.put("type", "success");
		return outJson;
	}

	// 修改密码
	@RequestMapping("/do-updatePwd.action")
	@ResponseBody
	public JSONObject doUpdatePwd(String oldPwd, String newPwd, String confirmPwd, HttpServletRequest req) {

		// 解密新密码
		// 解密后加密新密码
		try {
			byte[] decrypt = Rsa.decryptByPrivateKey(newPwd, RsaController.privateKey);
			newPwd = new String(decrypt);
			// 加密成md5
			newPwd = Md5.encryption(newPwd + newPwd.substring(0, 1));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			outJson.put("type", "fail");
			return outJson;
		}
		// 解密后加密重复密码
		try {
			byte[] decrypt = Rsa.decryptByPrivateKey(confirmPwd, RsaController.privateKey);
			confirmPwd = new String(decrypt);
			// 加密成md5
			confirmPwd = Md5.encryption(confirmPwd + confirmPwd.substring(0, 1));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			outJson.put("type", "fail");
			return outJson;
		}
		// 重复密码错误
		if (newPwd.equals(confirmPwd) == false) {
			// 用json
			outJson.put("type", "confirmPwdWrong");
			return outJson;
		}

		// 从session中取user
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		// 解密后再加密原密码
		// 解密密码再加密成md5
		// 解密密码
		try {
			byte[] decrypt = Rsa.decryptByPrivateKey(oldPwd, RsaController.privateKey);
			oldPwd = new String(decrypt);
			// 加密成md5
			oldPwd = Md5.encryption(oldPwd + oldPwd.substring(0, 1));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			outJson.put("type", "fail");
			return outJson;
		}
		// 原密码错误
		if (oldPwd.equals(user.getPwd()) == false) {
			// 用json
			outJson.put("type", "oldPwdWrong");
			return outJson;
		}

		// 修改密码
		try {
			userService.updatePwd(user.getId(), newPwd, user.getName());
		} catch (Exception e) {
			// 用json
			outJson.put("type", "fail");
			return outJson;
		}

		// 清空session
		session.setAttribute("user", null);
		// 用json
		outJson.put("type", "success");
		return outJson;
	}
}
