<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<title>后台管理</title>

<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
iframe {
	width: 100%;
	height: 100%;
}

.if-right {
	width: 100%;
	height: 95%;
}

a:hover {
	cursor: pointer;
}

</style>

</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">开心众包后台管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="img/ste2.png" class="layui-nav-img">
						${admin.name}
				</a>
					<dl class="layui-nav-child">
                        <dd>
                       	<a onclick='create()'>修改密码</a>                                            
                        </dd>
                        <dd>
                        <a href="adminLogin.html">退出</a>                      
                        </dd>
                         
					</dl></li>
				
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test" id="left">
					<li class="layui-nav-item ">
					<a href="javascript:;"><i class="layui-icon layui-icon-template-1" style="color:skyblue;"></i>&nbsp;业务管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" mySrc="buyerControl.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-username" style="color:skyblue;"></i>&nbsp;
								雇主管理</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="salerControl.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-chat" style="color:skyblue;"></i>&nbsp;
								服务商管理</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="empoyerAccount.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-dollar" style="color:skyblue;"></i>&nbsp;
								账务对账</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="needManage.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-survey" style="color:skyblue;"></i>&nbsp;
								需求管理</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="works.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-file-b" style="color:skyblue;"></i>&nbsp;
								作品管理</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="leagueManage.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-group" style="color:skyblue;"></i>&nbsp;
								联盟管理</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="credit.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-star" style="color:skyblue;"></i>&nbsp;
								信用分查询</a>
							</dd>
						</dl>
						</li>
						
						<li class="layui-nav-item ">
					<a href="javascript:;"><i class="layui-icon layui-icon-layer" style="color:skyblue;"></i>&nbsp;门户管理</a>
						<dl class="layui-nav-child">
							<dd>
							<a href="javascript:;" mySrc="story.html" onclick="changeIframe(this)">
							&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-edit" style="color:skyblue;"></i>&nbsp;
							雇主故事配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="brokeRule.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-tips" style="color:skyblue;"></i>&nbsp;
								曝光台配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="rule.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-about" style="color:skyblue;"></i>&nbsp;
								规则中心配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="sucCase.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-praise" style="color:skyblue;"></i>&nbsp;
								成功案例设置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="linker.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-link" style="color:skyblue;"></i>&nbsp;
								友情链接配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="trends.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-share" style="color:skyblue;"></i>&nbsp;
								行业动态配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="news.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-website" style="color:skyblue;"></i>&nbsp;
								最新资讯配置</a>
							</dd>
						</dl>
						</li>
						
						<li class="layui-nav-item ">
					<a href="javascript:;"><i class="layui-icon layui-icon-engine" style="color:skyblue;"></i>&nbsp;系统管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" mySrc="log.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-form" style="color:skyblue;"></i>&nbsp;
								日志查看</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="demandTypeConfig.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-auz" style="color:skyblue;"></i>&nbsp;
								需求类型配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="serverTypeConfig.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-component" style="color:skyblue;"></i>&nbsp;
								服务类型配置</a>
							</dd>
							<dd>
								<a href="javascript:;" mySrc="providerTypeConfig.html" onclick="changeIframe(this)">
								&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-app" style="color:skyblue;"></i>&nbsp;
								服务商类型配置</a>
							</dd>
						
						</dl>
						</li>
				</ul>
			</div>
		</div>

		<div class="layui-body">

			<div style="padding: 0px;" class="if-right">

				<iframe id="if-right" src="" width="100%" height="100%"></iframe>
			</div>
		</div>

		<div class="layui-footer"></div>
	</div>
	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
			//initOne(element);
			/* initMenu(element) */

		});
		
		//改变iframe的配置
       function changeIframe(item){
	    //跳转相应界面
	    $("#if-right").attr("src",$(item).attr("mySrc"));
	
       }
		
		
		
       layui.use('layer', function() {
			var layer = layui.layer;//执行一个laydate实例 
		
			//修改
			window.create = function() {
				layer.open({
					type: 2,
					title: false,
					shade: [0.2],
					area: ['400px', '300px'],
					content: 'modifyPwd.html', //iframe的url，no代表不显示滚动条
				});
			}
		});
		
		
		
		
	</script>
</body>

</html>

<script type="text/javascript" src="https://bot.4paradigm.com/web/assets/ics-web-sdk-js.js"></script>

<script type="text/javascript">

window.onload = function() {

IcsWebSdkJs.init('https://bot.4paradigm.com/web/chat/2751/adfb05bf-725a-4547-ad19-3d66f9bdcf36')

}

</script>