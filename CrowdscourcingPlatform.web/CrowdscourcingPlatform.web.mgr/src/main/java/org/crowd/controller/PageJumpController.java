package org.crowd.controller;

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
	@RequestMapping("MainFrame.html")
	public ModelAndView MainFrameJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager");
		return mv;
	}
	// 模版界面跳转

	@RequestMapping("model.html")
	public ModelAndView ModelJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("model");
		return mv;
	}

	// 需求类型配置界面的跳转
	@RequestMapping("demandTypeConfig.html")
	public ModelAndView DemandTypeConfig() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("demandTypeConfig");
		return mv;
	}

	// 故事配置界面跳转
	@RequestMapping("story.html")
	public ModelAndView Story() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("story");
		return mv;
	}

	// 发布故事界面跳转
	@RequestMapping("createStory.html")
	public ModelAndView createStory() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createStory");
		return mv;
	}

	// 故事详情界面跳转
	@RequestMapping("detailsStory.html")
	public ModelAndView detailsStory() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("detailsStory");
		return mv;
	}

	// 修改故事界面跳转
	@RequestMapping("updateStory.html")
	public ModelAndView updateStory() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateStory");
		return mv;
	}

	// 行业动态配置界面跳转
	@RequestMapping("trends.html")
	public ModelAndView Trend() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("trends");
		return mv;
	}

	// 行业动态发布界面跳转
	@RequestMapping("createTrends.html")
	public ModelAndView createTrends() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createTrends");
		return mv;
	}

	// 行业动态发布界面跳转
	@RequestMapping("updateTrends.html")
	public ModelAndView updateTrends() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateTrends");
		return mv;
	}

	// 日志查看界面跳转
	@RequestMapping("log.html")
	public ModelAndView log() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("log");
		return mv;
	}

	// 友情链接配置界面跳转
	@RequestMapping("linker.html")
	public ModelAndView linker() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("linker");
		return mv;
	}

	// 友情链接发布界面跳转
	@RequestMapping("createLinker.html")
	public ModelAndView createLinker() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createLinker");
		return mv;
	}

	// 友情链接发布界面跳转
	@RequestMapping("updateLinker.html")
	public ModelAndView updateLinker() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateLinker");
		return mv;
	}


	// 信用分查看界面跳转
	@RequestMapping("credit.html")
	public ModelAndView credit() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("credit");
		return mv;
	}

	// 修改信用分界面跳转
	@RequestMapping("updateCredit.html")
	public ModelAndView updateCredit() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateCredit");
		return mv;
	}

	// 雇主管理界面跳转
	@RequestMapping("buyerControl.html")
	public ModelAndView buyControlJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("buyerControl");
		return mv;
	}
	// 服务商管理界面跳转

	@RequestMapping("salerControl.html")
	public ModelAndView salerControlJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("salerControl");
		return mv;
	}
	
	@RequestMapping("adminLogin.html")
	public ModelAndView adminLoginJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminLogin");
		return mv;
	}

	// 需求管理界面的跳转

	@RequestMapping("needManage.html")
	public ModelAndView needManageJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("needManage");
		return mv;
	}

	// 服务类型配置界面的跳转

	@RequestMapping("serverTypeConfig.html")
	public ModelAndView serverTypeConfigJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("serverTypeConfig");
		return mv;
	}

	// 添加服务类型界面的跳转
	@RequestMapping("addServerType.html")
	public ModelAndView addServerTypeJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addServerType");
		return mv;
	}

	// 曝光台配置界面的跳转
	@RequestMapping("brokeRule.html")
	public ModelAndView brokeRuleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("brokeRule");
		return mv;
	}

	// 曝光台详情界面的跳转
	@RequestMapping("detailbrokeRule.html")
	public ModelAndView detailbrokeRuleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("detailbrokeRule");
		return mv;
	}

	// 规则中心界面跳转
	@RequestMapping("rule.html")
	public ModelAndView ruleControlJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ruleInfo");
		return mv;
	}

	// 添加一个新的需求类型弹出层界面

	@RequestMapping("addNewNeedType.html")
	public ModelAndView addNewNeedTypeJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addNewNeedType");
		return mv;
	}

	// 联盟管理
	@RequestMapping("leagueManage.html")
	public ModelAndView leagueManageJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("leagueManage");
		return mv;
	}


	// 联盟管理的弹出层界面(显示联盟详情)


	// LZW-->曝光台修改界面的跳转
	@RequestMapping("updateBrokeRule.html")
	public ModelAndView updateBrokeRuleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateBrokeRule");
		return mv;
	}

	// LZW-->曝光台发布违规
	@RequestMapping("addBrokeRule.html")
	public ModelAndView addBrokeRuleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addBrokeRule");
		return mv;
	}

	// 联盟管理的弹出层界面(显示联盟详情)

	@RequestMapping("leaDetialMeg.html")
	public ModelAndView leaDetialMegJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("leaDetialMeg");
		return mv;
	}

	// LZW-->服务商类型配置界面
	@RequestMapping("providerTypeConfig.html")
	public ModelAndView providerTypeConfigJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("providerTypeConfig");
		return mv;
	}
	
	// LZW-->新增服务商类型界面
	@RequestMapping("addProviderType.html")
	public ModelAndView addProviderTypeJsp() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("addProviderType");
		return mv;
	}

	// LZW-->作品管理界面
	@RequestMapping("works.html")
	public ModelAndView worksJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("works");
		return mv;
	}
	
	// LZW-->作品详情界面
	@RequestMapping("detailWork.html")
	public ModelAndView detailWorkJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("detailWork");
		return mv;
	}
	

	// zjw-->账务对账界面
		@RequestMapping("empoyerAccount.html")
		public ModelAndView empoyerAccountJsp() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("empoyerAccount");
			return mv;
		}
	
	//行业资讯配置界面(Lw)
	@RequestMapping("news.html")
	public ModelAndView newsMgrJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("newsMgr");
		return mv;
	}
	
	//行业资讯修改界面（Lw）
	@RequestMapping("updateNews.html")
	public ModelAndView updateNewsJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateNews");
		return mv;
	}
	
	//行业资讯新增界面（Lw）
	@RequestMapping("createNews.html")
	public ModelAndView createNewsJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createNews");
		return mv;
	}
	

	
	//修改密码界面
	@RequestMapping("modifyPwd.html")
	public ModelAndView modifyPwdJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("modifyPwd");
		return mv;
	}
	
	//成功案例界面(Lw)
	@RequestMapping("sucCase.html")
	public ModelAndView sucCaseJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sucCaseMgr");
		return mv;
	}
	
	//修改案例(Lw)
	@RequestMapping("updateSucCase.html")
	public ModelAndView updateSucCaseJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateSucCase");
		return mv;
	}
	
	//新增成功案例(Lw)
	@RequestMapping("createSucCase.html")
	public ModelAndView createSucCaseJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createSucCase");
		return mv;
	}
	
	//新增规则界面(Lw)
	@RequestMapping("createRule.html")
	public ModelAndView createRuleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createRule");
		return mv;
	}
	
	//修改规则界面(Lw)
	@RequestMapping("updateRule.html")
	public ModelAndView updateRuleJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateRule");
		return mv;
	}
	
	//修改规则界面(Lw)
	@RequestMapping("detailsSucCase.html")
	public ModelAndView detailsSucCaseJsp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("detailsSucCase");
		return mv;
	}
}