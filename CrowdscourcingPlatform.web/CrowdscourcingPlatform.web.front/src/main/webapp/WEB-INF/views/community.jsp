<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一站式众包社区</title>
<link rel="stylesheet" type="text/css"
	href="https://static.oschina.net/new-osc/js/utils/semantic-ui/semantic.min.css?t=1542621653000" />
<link type="text/css" rel="stylesheet"
	href="https://static.oschina.net/new-osc/dist/css/web.e6396b2e.css">
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<script type="text/javascript">
	window.__STATIC_DOMAIN = "https://static.oschina.net";
</script>
<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="3rd/layui/css/global.css">
<link rel="stylesheet" href="css/footer.css">
<style type="text/css">
.zbj-footer-warp-v1 .zbj-footer-friend-tab .zbj-footer-tab-name {
    display: block;
    height: 36px;
    line-height: 36px;
    padding: 0 14px;
    text-align: center;
    color: white;
    position: relative;
    font-size: 15px;
    cursor: auto;
    width: 100px;
    margin-left: -14px;
}
.fly-footer {
    background: #232830;
    height: 251px;
    margin-top: 210px;
}
html,
body {
	overflow-x:inherit;
}

</style>
</head>
<body style="margin-top: 65px;">
	<!-- 导航栏 -->
	<div class="my-content">
	<div class="fly-header layui-bg-black" style="white-space: nowrap">
		<div class="layui-container-logo">
				<a href="homePage.html" style="color: #FFB800;font-size: 22px;line-height: 56px;font-family:'华文细黑'">
				<img src="img/logo.png" />
				
				<span style="color: white;font-family: '微软雅黑';">开心</span>众包</a>
				
			</div>
		<div class="layui-container-one">
			<ul class="layui-nav my-ul" lay-filter="">
				
				<li class="layui-nav-item "><a href="postNeedSelectType.html"
					class="a-text">发布需求</a></li>
				<li class="layui-nav-item"><a href="postWorkSelectType.html"
					class="a-text">发布作品</a></li>
				<li class="layui-nav-item"><a href="community.html" class="a-text">社区</a></li>
			</ul>
		</div>
		<div class="layui-container-two">
			<ul class="layui-nav my-ul">
				<li class="layui-nav-item"><a href="workTable.html"
					class="a-text">工作中心</a></li>
				<li class="layui-nav-item"><a href="leagueCenter.html"
					class="a-text">联盟中心</a></li>
				<li class="layui-nav-item" id="is-login" user="${user.id}"><a href="javascript:;" class="a-text"><img
						src="${user.src}" class="layui-nav-img" id="imgHead">我</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="personalCenter.html">个人中心</a>
						</dd>

						<dd>
							<a href="logining.html">退出</a>
						</dd>
					</dl></li>
			</ul>
		</div>
	</div>

	<!-- 主体内容 -->
	<div style="margin-left: 10%; margin-right: 10%;">
		<x-foo-define data-define="web-news-index"></x-foo-define>
		<div class="ui internally grid web-news">
			<div class="row">
				<div class="sixteen wide column">

					<div class="ui three column stackable grid top-recommend-news">
						<div class="column card-wrap">
							<a class="ui fluid card"
								href="http://lol.duowan.com/1808/398043436258.html"
								target="_blank">
								<div class="image">
									<img src="img/new1.jpg" />
								</div>
								<div class="content">
									<div class="header">女警终获加强！版本史诗级改动！</div>
								</div>
							</a>
						</div>
						<div class="column card-wrap">
							<a class="ui fluid card"
								href="https://baijiahao.baidu.com/s?id=1618907723249976690&wfr=spider&for=pc"
								target="_blank">
								<div class="image">
									<img src="img/new2.jpg" />
								</div>
								<div class="content">
									<div class="header">8.23暴走萝莉全新Poke玩法，黑暗收割穿甲流引爆全场！</div>
								</div>
							</a>
						</div>
						<div class="column card-wrap">
							<a class="ui fluid card"
								href="https://baijiahao.baidu.com/s?id=1619633132051668982&wfr=spider&for=pc"
								target="_blank">
								<div class="image">
									<img src="img/new3.jpg" />
								</div>
								<div class="content">
									<div class="header">VN忍气吞声这么久，终于在S9迎来加强，最强AD强势归来</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="twelve wide computer eleven wide tablet sixteen wide mobile column">
					<div class="scroll-tab hidden-scroll">
						<div class="ui green pointing secondary massive menu news-tab">
							<a class="active item" data-tab="news" onclick="menuClick(this)">最新资讯</a>
							<a class=" item" data-tab="trends" onclick="menuClick(this)">行业动态</a>
							<a class=" item" data-tab="storys" onclick="menuClick(this)">雇主故事</a>
							<a class=" item" data-tab="brokerules" onclick="menuClick(this)">曝光台</a>
						</div>
					</div>

					<!-- 最新资讯 -->
					<div class="ui basic segment active tab article-list"
						data-tab="news" id="news">
						<div
							class="ui very relaxed items list-container news-list-container"
							style="margin-left: 20px;" id="newsContent"></div>
						<!-- 分页 -->
						<div id="newsPage" align="center"></div>
					</div>

					<!-- 行业动态 -->
					<div class="ui basic segment tab article-list" data-tab="trends"
						id="trends">
						<div
							class="ui very relaxed items list-container news-list-container"
							style="margin-left: 20px;" id="trendsContent"></div>
						<!-- 分页 -->
						<div id="trendsPage" align="center"></div>
					</div>

					<!-- 雇主故事 -->
					<div class="ui basic segment tab article-list" data-tab="storys"
						id="storys">
						<div
							class="ui very relaxed items list-container news-list-container"
							style="margin-left: 20px;" id="storysContent"></div>
						<!-- 分页 -->
						<div id="storysPage" align="center"></div>
					</div>

					<!-- 曝光台 -->
					<div class="ui basic segment tab article-list"
						data-tab="brokerules" id="brokerules">
						<div
							class="ui very relaxed items list-container news-list-container"
							style="margin-left: 20px;" id="brokerulesContent"></div>
						<!-- 分页 -->
						<div id="brokerulesPage" align="center"></div>
					</div>

				</div>
				<!-- 热门资讯 -->
				<div
					class="four wide computer five wide tablet sixteen wide mobile column sidebar news-sidebar"
					style="padding-top: 15px;">
					<div class="section articles-list">
						<div class="ui items">
							<h3 class="ui header">热门资讯</h3>
							<div class="item">
								<div class="content">
									<a class="header" href="/news/102645/react-vs-vuejs">React
										和 Vue 到底谁更牛？听听尤雨溪怎么说</a>
									<div class="extra">
										<div class="ui horizontal mini list">
											<div class="item">
												<a href="https://my.oschina.net/mrtudou" target="_blank">王练</a>
											</div>
											<div class="item">12/13 08:29</div>
											<div class="item">
												<a href="/news/102645/react-vs-vuejs#comments"
													target="_blank"><i class="comment outline icon"></i> 55
													评论</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="fly-footer">

	<div class="zbj-footer-warp-v1">
		
		<div class="zbj-footer-width-ctrl">
			<div class="zbj-footer-friend-links">
				<ul class="zbj-footer-friend-tab" id="zbjFooterTab">

					<li class="zbj-footer-friend-li">
						<span class="zbj-footer-tab-name" data-linkid="zbjindex2018-footer-friendlink-0-tab" title="友情链接">友情链接</span>
						<div class="zbj-footer-tab-panel" id="panel">
							
						</div>
					</li>

				</ul>

			</div>
			<div class="div-help">
				<ul class="menu vertical menu-ul">
					<li class="menu-text">项目中心</li>
					<li>
						<a href="" target="_blank">发布作品</a>
					</li>
					<li>
						<a href="" target="_blank">搜索作品</a>
					</li>
					<li>
						<a href="" target="_blank">发布需求</a>
					</li>
					<li>
						<a d href="" target="_blank">搜索需求</a>
					</li>
				</ul>
			</div>
			<div class="div-help-two">
				<ul class="menu vertical menu-ul">
					<li class="menu-text">帮助中心</li>
					<li>
						<a href="" target="_blank">新手指南</a>
					</li>
					<li>
						<a href="" target="_blank">常见问题</a>
					</li>
					<li>
						<a href="rulesCenter.html" target="_blank">规则中心</a>
					</li>
					<li>
						<a d href="" target="_blank">意见建议反馈</a>
					</li>
				</ul>
			</div>
			<div class="div-help-three">
				<ul class="menu vertical menu-ul">
					<li class="menu-text">技术咨询</li>
					<li>
						<span >电话：10086</span>
					</li>
					<li>
						<span >QQ：10086</span>
					</li>
					<li>
						<span >微信：zjw6666</span>
					</li>
					<li>
						<span >
						<i class="layui-icon layui-icon-cellphone" style="font-size: 25px;"></i> 
						&nbsp;&nbsp;&nbsp;
						<i class="layui-icon layui-icon-login-wechat" style="font-size: 25px;"></i> 
						&nbsp;&nbsp;&nbsp;
						<i class="layui-icon layui-icon-login-qq" style="font-size: 25px;"></i> 
						</span>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
	<div class="zbj-footer-cutting-line">
		
	</div>
	<p style="margin-top: 10px;font-size: 13px;text-align: center;">
		2018 &copy;JF1806郑家伟组出品
	</p>
</div>
	<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
	<script type="text/javascript" src="js/isLogin.js"></script>
	<script>
	layui.use('element', function() {
		var element = layui.element;
	});

	
		var layer;
		layui.use('layer', function() {
			var layer = layui.layer;
		});

		//点击三个按钮(最新资讯、行业动态、雇主故事的效果)
		function menuClick(e) {
			//先清空样式
			$(e).parent().children().attr("class", "item");
			//设置被点击的样式
			$(e).attr("class", "active item");

			//清空内容的样式
			$("#news").attr("class", "ui basic segment tab article-list");
			$("#storys").attr("class", "ui basic segment tab article-list");
			$("#trends").attr("class", "ui basic segment tab article-list");
			$("#brokerules").attr("class", "ui basic segment tab article-list");

			//设置被点击的内容的样式
			var id = $(e).attr("data-tab");
			$("#" + id).attr("class",
					"ui basic segment active tab article-list");
		}

		//***************放置内容***************
		window.onload = function() {
			showNews();
			showTrends();
			showStorys();
			showBrokerules();
		}
		//***放置最新资讯***	
		//分页参数(初始化的)
		//从哪里开始
		var start = 0;
		//每页的条数
		var limit = 5;
		//当前页
		var newsIndex = 1;

		function showNews() {
			//分页初始化数据
			$("#newsContent").find(".news-item").remove();
			$
					.ajax({
						url : "do-showNews.action",
						type : "post",
						data : {
							"start" : start,
							"limit" : limit
						},
						dataType : "json",
						success : function(msg) {
							//返回回来的总条数
							var count = msg.newsCount;
							//页码的处理
							layui
									.use(
											'laypage',
											function() {
												var laypage = layui.laypage;

												laypage
														.render({
															//分页模块的id
															elem : 'newsPage',
															limit : limit, //设置limit
															count : count, //设置count 从服务端得到
															curr : newsIndex, //设置当前页
															jump : function(
																	obj, first) {
																//首次不执行
																if (!first) {
																	start = (obj.limit * (obj.curr - 1));
																	newsIndex = obj.curr;
																	showNews();
																}
															}
														});
											});
							//数据的处理
							var news = msg.news;
							for (var i = 0; i < news.length; i++) {
								var n = news[i];
								$("#newsContent")
										.append(
												"<div class='item news-item'><div class='content'><h3 class='header'>"
														+ "<a href='" + n.link + "' target='_blank'>"
														+ n.name
														+ "</a></h3><div class='extra'>"
														+ "<div class='ui horizontal list'><div class='item'>管理员</a></div>"
														+ "<div class='item'>"
														+ n.createTime
																.substring(0,
																		16)
														+ "</div></div></div></div></div>");
							}
						},
						error : function() {
							layer.msg('请求失败！', {
								icon : 2,
								time : 1000, //20s后自动关闭
							});
						}
					});	
		}

		//***放置行业动态***	
		//分页参数(初始化的)
		//当前页
		var trendsIndex = 1;

		function showTrends() {
			//分页初始化数据
			$("#trendsContent").find(".news-item").remove();
			$
					.ajax({
						url : "do-showTrends.action",
						type : "post",
						data : {
							"start" : start,
							"limit" : limit
						},
						dataType : "json",
						success : function(msg) {
							//返回回来的总条数
							var count = msg.trendsCount;
							//页码的处理
							layui
									.use(
											'laypage',
											function() {
												var laypage = layui.laypage;

												laypage
														.render({
															//分页模块的id
															elem : 'trendsPage',
															limit : limit, //设置limit
															count : count, //设置count 从服务端得到
															curr : trendsIndex, //设置当前页
															jump : function(
																	obj, first) {
																//首次不执行
																if (!first) {
																	start = (obj.limit * (obj.curr - 1));
																	trendsIndex = obj.curr;
																	showTrends();
																}
															}
														});
											});
							//数据的处理
							var trends = msg.trends;
							for (var i = 0; i < trends.length; i++) {
								var trend = trends[i];
								$("#trendsContent")
										.append(
												"<div class='item news-item'><div class='content'><h3 class='header'>"
														+ "<a href='" + trend.link + "' target='_blank'>"
														+ trend.name
														+ "</a></h3><div class='extra'>"
														+ "<div class='ui horizontal list'><div class='item'>管理员</a></div>"
														+ "<div class='item'>"
														+ trend.createTime
																.substring(0,
																		16)
														+ "</div></div></div></div></div>");
							}
						},
						error : function() {
							layer.msg('请求失败！', {
								icon : 2,
								time : 1000, //20s后自动关闭
							});
						}
					});
		}

		//***放置雇主故事***	
		//分页参数(初始化的)
		//当前页
		var storysIndex = 1;

		function showStorys() {
			//分页初始化数据
			$("#storysContent").find(".news-item").remove();
			$
					.ajax({
						url : "do-showStorys.action",
						type : "post",
						data : {
							"start" : start,
							"limit" : limit
						},
						dataType : "json",
						success : function(msg) {
							//返回回来的总条数
							var count = msg.storysCount;
							//页码的处理
							layui
									.use(
											'laypage',
											function() {
												var laypage = layui.laypage;

												laypage
														.render({
															//分页模块的id
															elem : 'storysPage',
															limit : limit, //设置limit
															count : count, //设置count 从服务端得到
															curr : storysIndex, //设置当前页
															jump : function(
																	obj, first) {
																//首次不执行
																if (!first) {
																	start = (obj.limit * (obj.curr - 1));
																	storysIndex = obj.curr;
																	showStorys();
																}
															}
														});
											});
							//数据的处理
							var storys = msg.storys;
							for (var i = 0; i < storys.length; i++) {
								var story = storys[i];
								$("#storysContent")
										.append(
												"<div class='item news-item'><div class='content'><h3 class='header'>"
														+ "<a href='javascript:;' target='_blank'>"
														+ story.title
														+ "</a></h3>"
														+ "<div class='description'><p class='line-clamp'>"
														+ story.content
														+ "</p></div><div class='extra'>"
														+ "<div class='ui horizontal list'><div class='item'>"
														+ story.useName
														+ "</a></div>"
														+ "<div class='item'>"
														+ story.createTime
																.substring(0,
																		16)
														+ "</div></div></div></div></div>");
							}
						},
						error : function() {
							layer.msg('请求失败！', {
								icon : 2,
								time : 1000, //20s后自动关闭
							});
						}
					});
		}

		//***放置曝光台***	
		//分页参数(初始化的)
		//当前页
		var brokerulesIndex = 1;

		function showBrokerules() {
			//分页初始化数据
			$("#brokerulesContent").find(".news-item").remove();
			$
					.ajax({
						url : "do-showBrokerules.action",
						type : "post",
						data : {
							"start" : start,
							"limit" : limit
						},
						dataType : "json",
						success : function(msg) {
							//返回回来的总条数
							var count = msg.brokerulesCount;
							//页码的处理
							layui
									.use(
											'laypage',
											function() {
												var laypage = layui.laypage;

												laypage
														.render({
															//分页模块的id
															elem : 'brokerulesPage',
															limit : limit, //设置limit
															count : count, //设置count 从服务端得到
															curr : brokerulesIndex, //设置当前页
															jump : function(
																	obj, first) {
																//首次不执行
																if (!first) {
																	start = (obj.limit * (obj.curr - 1));
																	brokerulesIndex = obj.curr;
																	showBrokerules();
																}
															}
														});
											});
							//数据的处理
							var brokerules = msg.brokerules;
							for (var i = 0; i < brokerules.length; i++) {
								var brokerule = brokerules[i];
								$("#brokerulesContent")
										.append(
												"<div class='item news-item'><div class='content'><h3 class='header'>"
														+ "<a href='javascript:;' target='_blank'>违规人："
														+ brokerule.useName
														+ "</a></h3>"
														+ "<div class='description'><p class='line-clamp'>"
														+ brokerule.ruleContent
														+ "</p></div><div class='extra'>"
														+ "<div class='ui horizontal list'><div class='item'>管理员</a></div>"
														+ "<div class='item'>"
														+ brokerule.createTime
																.substring(0,
																		16)
														+ "</div></div></div></div></div>");
							}
						},
						error : function() {
							layer.msg('请求失败！', {
								icon : 2,
								time : 1000, //20s后自动关闭
							});
						}
					});
		}

		//动态生成友情链接
		function initLinker() {
			$.ajax({
				url : "initLinker.action",
				type : "post",
				data : {},
				dataType : "json",
				success : function(msg) {

					var linker = msg.linker;

					var panel = $("#panel");

					panel.empty();

					for (var i = 0; i < linker.length; i++) {

						var lin = linker[i];
						panel.append("<a href="+lin.link +">" + lin.name
								+ "</a>");
					}
				},
				error : function() {
					alert("请求失败！");
				}
			});
		}
		initLinker();
	</script>
</body>
</html>
