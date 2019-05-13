package org.crowd.controller;

import javax.servlet.http.HttpServletRequest;

import org.crowd.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * <p>
 * Title : PageJumpController
 * </p>
 * <p>
 * Description :
 * </p>
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 * <p>
 * DevelopSystem : window 7
 * </p>
 * <p>
 * Company : org.crowd
 * </p>
 * 
 * @author : zhengjiawei
 * @date : 2018年12月6日 下午1:26:07
 * @version : 12.0.0
 */

@Controller
public class PageJumpController {
	// 界面跳转的controller

	// 主界面跳转
	@RequestMapping("model.html")
	public ModelAndView MainFrameJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("model");
		return mv;
	}

	// LZW-->作品发布界面
	@RequestMapping("upWorks.html")
	public ModelAndView upWorksJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("upWorks");
		return mv;
	}

	// LZW-->作品查询界面
	@RequestMapping("workSearch.html")
	public ModelAndView workSearchJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("workSearch");
		return mv;
	}

	// 登录界面跳转
	@RequestMapping("/login.html")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	// 发布需求界面的选择需求界面跳转（zjw）
	@RequestMapping("postNeedSelectType.html")
	public ModelAndView postNeedSelectTypeJsp(HttpServletRequest req) {

		ModelAndView mv = new ModelAndView();
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			mv.setViewName("postNeedSelectType");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}
	// 添加新需求界面跳转(zjw)

	@RequestMapping("addNewNeed.html")
	public ModelAndView addNewNeedJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("addNewNeed");
		return mv;
	}
	// 跳转到查看需求界面zjw

	// 个人投标界面zjw
	@RequestMapping("singleTender.html")
	public ModelAndView singleTenderJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("singleTender");
		return mv;
	}

	@RequestMapping("showNeed.html")
	public ModelAndView showNeedWithServJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showNeed");
		return mv;
	}

	// 服务类型进来后的选择查看需求还是作品界面
	@RequestMapping("selectWorkOrNeed.html")
	public ModelAndView selectWorkOrNeedJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("selectWorkOrNeed");
		return mv;
	}

	// 前端主页
	@RequestMapping("homePage.html")
	public ModelAndView homePageJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("homePage");
		return mv;
	}

	// 跳转到查看作品界面-->LZW
	@RequestMapping("showWorkWithServ.html")
	public ModelAndView showWorkWithServJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("showWorkWithServ");
		return mv;
	}

	// 盟主选择是以个人投标还是以联盟投标zjw
	@RequestMapping("myselefOrLea.html")
	public ModelAndView myselefOrLeaJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("myselefOrLea");
		return mv;
	}

	// 个人中心界面跳转
	@RequestMapping("/personalCenter.html")
	public ModelAndView personalCenter(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			mv.setViewName("personalCenter");
		} else {
			mv.setViewName("login");
		}

		return mv;
	}

	// 个人中心-基本信息界面跳转
	@RequestMapping("/showUserInfo.html")
	public ModelAndView showUserInfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showUserInfo");
		return mv;
	}

	// 个人中心-修改个人信息界面跳转
	@RequestMapping("/updateUserInfo.html")
	public ModelAndView updateUserInfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateUserInfo");
		return mv;
	}

	// 个人中心-充值界面跳转
	@RequestMapping("/recharge.html")
	public ModelAndView recharge() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recharge");
		return mv;
	}

	// 个人中心-确认充值界面跳转
	@RequestMapping("/confirmRecharge.html")
	public ModelAndView confirmRecharge() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("confirmRecharge");
		return mv;
	}

	// 个人中心-雇主-订单管理界面跳转
	@RequestMapping("/accountManagement.html")
	public ModelAndView accountManagement() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountManagement");
		return mv;
	}

	// 个人中心-服务商-订单管理界面跳转
	@RequestMapping("/accountManagementForProvider.html")
	public ModelAndView accountManagementForProvider() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountManagementForProvider");
		return mv;
	}

	// 个人中心-修改密码
	@RequestMapping("/updatePwd.html")
	public ModelAndView updatePwd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatePwd");
		return mv;
	}

	// 社区
	@RequestMapping("/community.html")
	public ModelAndView community() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("community");
		return mv;
	}

	// 工作台界面跳转
	@RequestMapping("workTable.html")
	public ModelAndView workTableJsp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			mv.setViewName("workTable");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	// 需求详情界面
	@RequestMapping("needDeti.html")
	public ModelAndView needDetiJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("needDeti");
		return mv;
	}

	// 作品详情界面
	@RequestMapping("workDeti.html")
	public ModelAndView workDetiJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("workDeti");
		return mv;
	}

	// 规则中心界面
	@RequestMapping("rulesCenter.html")
	public ModelAndView rulesCenterJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rulesCenter");
		return mv;
	}

	// 投标人的详情界面zjw
	@RequestMapping("tenderDetiPeople.html")
	public ModelAndView tenderDetiPeopleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tenderDetiPeople");
		return mv;
	}

	// 注册
	@RequestMapping("reg.html")
	public ModelAndView reg() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reg");
		return mv;
	}

	// 注册
	@RequestMapping("A9.html")
	public ModelAndView A9() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("A9");
		return mv;
	}

	// 进行中的需求显示中标人信息

	@RequestMapping("bidMegAfoot.html")
	public ModelAndView bidMegAfootJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bidMegAfoot");
		return mv;
	}

	// 作品修改界面

	@RequestMapping("updateWork.html")
	public ModelAndView updateWorkJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateWork");
		return mv;
	}
	// 发布作品类型界面

	@RequestMapping("postWorkSelectType.html")
	public ModelAndView postWorkSelectTypeJsp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			if (user.getType() == 0) {
				// 跳到成为服务商界面
				mv.setViewName("toProvider");
			} else {
				mv.setViewName("postWorkSelectType");
			}
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	// 联盟中心的页面跳转
	@RequestMapping("leagueCenter.html")
	public ModelAndView leagueCenterJsp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			if (user.getType() == 0) {
				// 跳到成为服务商界面
				mv.setViewName("toProvider");
			} else {
				mv.setViewName("leagueCenter");
			}
		} else {
			mv.setViewName("login");
		}

		return mv;
	}

	// 新增联盟的页面跳转
	@RequestMapping("newLeague.html")
	public ModelAndView newLeagueJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("newLeague");
		return mv;
	}

	// 需求发布规则界面
	@RequestMapping("ruleAboutPostNeed.html")
	public ModelAndView ruleAboutPostNeedJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ruleAboutPostNeed");
		return mv;
	}

	// 投标规则界面
	@RequestMapping("ruleAboutBid.html")
	public ModelAndView ruleAboutBidJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ruleAboutBid");
		return mv;
	}

	// 支付宝APIS
	@RequestMapping("/alipay.trade.page.pay")
	public ModelAndView pay_jsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("alipay.trade.page.pay");
		return mv;
	}

	@RequestMapping("/index")
	public ModelAndView index_jsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/notify_url")
	public ModelAndView notify_url_jsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notify_url");
		return mv;
	}

	// 显示联盟信息界面
	@RequestMapping("showLeaMessage.html")
	public ModelAndView showLeaMessageJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showLeaMessage");
		return mv;
	}

	// 服务商交付需求上传文件界面
	@RequestMapping("uploadNeedFile.html")
	public ModelAndView uploadNeedFileJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("uploadNeedFile");
		return mv;
	}

	// 跳转到联盟浏览界面
	@RequestMapping("browseLeague.html")
	public ModelAndView browseLeagueJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("browseLeague");
		return mv;
	}
	// 跳转到盟主管理联盟成员界面

	@RequestMapping("leaguePeopleManage.html")
	public ModelAndView leaguePeopleManageJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("leaguePeopleManage");
		return mv;
	}

	// 联盟投标界面
	@RequestMapping("leagueTender.html")
	public ModelAndView leagueTenderJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("leagueTender");
		return mv;
	}

	// 联盟投标详情界面
	@RequestMapping("tenderDetiLeague.html")
	public ModelAndView tenderDetiLeagueJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tenderDetiLeague");
		return mv;
	}

	// 查看联盟投标信息界面（进行中的）
	@RequestMapping("bidLeagueMeg.html")
	public ModelAndView bidLeagueMegJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bidLeagueMeg");
		return mv;
	}
	// 联盟的投标中心界面

	@RequestMapping("leagueWorkTable.html")
	public ModelAndView leagueWorkTableJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("leagueWorkTable");
		return mv;
	}
	// 成为服务商界面

	@RequestMapping("toProvider.html")
	public ModelAndView toProviderJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("toProvider");
		return mv;
	}

	// 作品查询界面

	@RequestMapping("showWork.html")
	public ModelAndView showWorkJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("showWork");
		return mv;
	}
	// 上传作品界面

	@RequestMapping("uploadWorkFile.html")
	public ModelAndView uploadWorkFileJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("uploadWorkFile");
		return mv;
	}

	// rsa测试界面
	@RequestMapping("rsaTest.html")
	public ModelAndView rsaTestJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("rsaTest");
		return mv;
	}

	// 选择服务商类型界面
	@RequestMapping("providerTypeConfig.html")
	public ModelAndView providerTypeConfig() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("providerTypeConfig");
		return mv;
	}

	// 返回登入界面（请session）
	@RequestMapping("logining.html")
	public ModelAndView logining(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
//		request.getSession().setAttribute("user", null);
		request.getSession().invalidate();
		mv.setViewName("login");
		return mv;
	}

	//关闭充值界面
	@RequestMapping("close.html")
	public ModelAndView closeJsp(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("close");
		return mv;
	}

}
