<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>用户主页</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/footer.css">
	</head>
	<style type="text/css">
		.project-type-box {
			display: -webkit-box;
			display: -ms-flexbox;
			display: flex;
			-webkit-box-align: center;
			-ms-flex-align: center;
			align-items: center;
			-webkit-box-pack: center;
			-ms-flex-pack: center;
			justify-content: center;
			text-align: center;
			margin-bottom: 80px;
		}
		
		.project-type-box .item {
			border-radius: 3px;
			background: #fff;
			width: 400px;
			min-height: 400px;
			-webkit-box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
			box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
			margin: 0 30px;
			cursor: pointer;
		}
		
		.project-type-box .item:hover {
			-webkit-box-shadow: 0 0 10px #2093ff;
			box-shadow: 0 0 10px #2093ff;
		}
		
		.project-type-box .item .type-icon {
			display: block;
			width: 400px;
		}
		
		.project-type-box .item .type-title {
			display: block;
			font-size: 24px;
			margin-top: 10px;
			background: #eeeeee;
			padding: 5px;
		}
		
		.project-type-box .item .type-desc {
			line-height: 22px;
			font-size: 13px;
			padding: 0 16px;
			display: block;
			text-align: left;
			margin-top: 16px
		}
		
		.loading {
			margin-top: 30px
		}
		
		.loading .el-loading-spinner .el-loading-text {
			margin: 20px 0 0 -25px;
			width: 100px
		}
	</style>
	<style type="text/css">
		.work-body {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .1);
			box-shadow: 0 0 20px rgba(0, 0, 0, .1);
			width: 100%;
			height: 300px;
			margin-top: 100px;
			margin-right: 20px;
			padding-top: 50px;
			cursor: pointer;
		}
		
		.need-body {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .1);
			box-shadow: 0 0 20px rgba(0, 0, 0, .1);
			width: 100%;
			height: 300px;
			margin-top: 100px;
			margin-left: 20px;
			padding-top: 50px;
			cursor: pointer;
		}
		
		.need-body:hover {
			cursor: pointer;
		}
		
		.work-body:hover {
			cursor: pointer;
		}
	</style>
	<style>
		.img1 {
			background-image: url(img/1.jpg);
			background-repeat: no-repeat;
			background-size: 100% 100%;
		}
		.img {
			background-image: url(img/455.jpg);
			background-repeat: no-repeat;
			background-size: 100% 100%;
		}
		
		.container-one {
			position: absolute;
			z-index: 3;
			margin-left: 326.5px;
		}
		
		.container-two {
			position: absolute;
			z-index: 3;
			margin-left: 1013px;
		}
		
		.layui-nav {
			background-color: rgba(0, 0, 0, 0);
		}
		
		.col-md-12 {
			position: relative;
			min-height: 1px;
			padding-right: 15px;
			padding-left: 15px;
			text-align: center;
			margin-top: 40px;
			margin-bottom: 80px;
		}
		
		.features-header-line {
			height: 3px;
			margin: 0 auto;
			border-left: 80px solid #ddd;
			border-right: 80px solid #ddd;
			background-color: #0c8484;
			width: 80px;
			margin-top: 15px;
		}
		
		.features-header-line-two {
			height: 3px;
			margin: 0 auto;
			border-left: 100px solid #ddd;
			border-right: 100px solid #ddd;
			background-color: #0c8484;
			width: 100px;
			margin-top: 15px;
		}
		
		.item:hover .span-text {
			display: inline !important;
			color: white;
		}
		
		.item:hover .div-text {
			margin-top: -50px;
			height: 50px;
			background-color: #63b5fb;
		}
	</style>
	<style>
		.feature-center {
			text-align: center;
			padding-left: 43px;
			float: left;
			width: 20%;
			margin-bottom: 40px;
		}
		
		#gtco-counter .display-t,
		#gtco-counter .display-tc {
			height: 244px;
			display: table;
			width: 100%;
			padding-top: 12px;
		}
		
		#gtco-counter .icon i {
			height: 70px;
		}
		
		.feature-center .icon i {
			display: table-cell;
			vertical-align: middle;
			height: 90px;
			font-size: 30px;
			line-height: 30px;
			color: #52d3aa;
		}
		
		#gtco-counter .icon {
			width: 70px;
			height: 70px;
			text-align: center;
			-webkit-box-shadow: 0px 14px 30px -15px rgba(0, 0, 0, 0.75);
			-moz-box-shadow: 0px 14px 30px -15px rgba(0, 0, 0, 0.75);
			box-shadow: 0px 14px 30px -15px rgba(0, 0, 0, 0.75);
			margin-bottom: 30px;
			margin: 0 auto 30px auto;
			border-radius: 50%;
			display: table;
			background: #efefef;
		}
		
		#gtco-counter .counter {
			font-size: 28px;
			margin-bottom: 10px;
			color: #fff;
			font-weight: 100;
			display: block;
		}
		
		.animated-fast {
			-webkit-animation-duration: .5s;
			animation-duration: .5s;
			-webkit-animation-fill-mode: both;
			animation-fill-mode: both;
		}
		
		.fadeInUp {
			-webkit-animation-name: fadeInUp;
			animation-name: fadeInUp;
		}
		
		.row {
			margin-left: -15px;
			margin-right: -15px;
		}
		
		#gtco-header,
		#gtco-counter,
		.gtco-bg {
			position: relative;
			margin: 0 auto;
			padding-left: 15px;
			padding-right: 15px;
			width: 80%;
			height: 200px;
			margin-left: auto;
			margin-right: auto;
		}
		
		#gtco-counter .counter-label {
			margin-bottom: 0;
			text-transform: uppercase;
			color: rgba(255, 255, 255, 0.5);
			letter-spacing: .1em;
			font-size: 17px;
		}
		.layui-container-logo {
			padding: 0;
			margin-left: 188px;
			position: absolute;
			z-index: 3;
		}
		.layui-container-logo img{
			height: 40px;
			margin-top: -7px;
		}
	</style>

	<body>
	<h1><%=request.getLocalPort()%></h1>
	<h1><%=request.getSession().getId() %></h1>
		<div class="layui-bg-black layui-carousel" style="white-space: nowrap" id="test1">
			<div class="layui-container-logo">
				<a href="homePage.html" style="color: #FFB800;font-size: 22px;line-height: 56px;font-family:'华文细黑'">
					<img src="img/logo.png" />

					<span style="color: white;font-family: '微软雅黑';">开心</span>众包</a>

			</div>
			<div class="container-one">
				<ul class="layui-nav my-ul" lay-filter="">
				
					<li class="layui-nav-item ">
						<a href="postNeedSelectType.html" class="a-text">发布需求</a>
					</li>
					<li class="layui-nav-item">
						<a href="postWorkSelectType.html" class="a-text">发布作品</a>
					</li>
					<li class="layui-nav-item">
						<a href="community.html" class="a-text">社区</a>
					</li>
				</ul>
			</div>
			<div class="container-two">
				<ul class="layui-nav my-ul">
					<li class="layui-nav-item">
						<a href="workTable.html" class="a-text">工作中心</a>
					</li>
					<li class="layui-nav-item">
						<a href="leagueCenter.html" class="a-text">联盟中心</a>
					</li>
					<li class="layui-nav-item" id="is-login" user="${user.id}">
						<a href="javascript:;" class="a-text"><img src="${user.src}" class="layui-nav-img">我</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="personalCenter.html">个人中心</a>
							</dd>

							<dd>
								<a href="logining.html">退出</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div carousel-item>
				<div class="img"></div>
				<div class="img1"></div>

			</div>

		</div>
		<div class="col-md-12">
			<p style="font-size: 24px;">您可以</p>
			<div class="features-header-line"></div>
		</div>
		<!--作品需求--------------------------->
		<div class="project-type-box">
			<div class="item" onclick="work()">

				<img src="img/work.jpg" alt="" class="type-icon">
				<span class="type-title">项目作品</span>
				<span class="type-desc">浏览网站上服务商们发布的作品,用户可根据需要进行购买</span>
				<span class="type-desc" style="padding-bottom: 51px;">特点：作品目标单一明确、涉及广、交易保障</span></a>
				<div class="div-text">
					<span class="span-text" style="display: none;">
							<i class="layui-icon layui-icon-search " style="font-size: 19px;line-height: 50px;">&nbsp;作品搜索</i>
							</span>
				</div>
			</div>
			<div class="item" onclick="need()">
				<img src="img/need.jpg" alt="" class="type-icon">
				<span class="type-title">项目需求</span>
				<div class="type-desc">
					<span>浏览网站上雇主发布的需求,服务商可对感兴趣需求的进行投标</span>
				</div> <span class="type-desc" style="padding-bottom: 51px;">特点：需求类型丰富、拥有众多优质服务商、</span></a>
				<div class="div-text">
					<span class="span-text" style="display: none;">
							<i class="layui-icon layui-icon-search " style="font-size: 19px;line-height: 50px;">&nbsp;需求搜索</i>
							</span>
				</div>
			</div>
		</div>
		<!--4个圈圈-->
		<div class="col-md-12">
			<p style="font-size: 24px;">精心打造</p>
			<div class="features-header-line-two"></div>
		</div>
		<div id="gtco-counter" class="gtco-bg gtco-counter animated" style="background-image:url(img/img_bg_2.jpg);">
			<div class="gtco-container">
				<div class="row">
					<div class="display-t">
						<div class="display-tc">
							<div class="col-md-3 col-sm-6 animate-box fadeInUp animated-fast">
								<div class="feature-center">
									<span class="icon">
									<i class="layui-icon layui-icon-user" style="font-size: 36px;"></i>
								</span>

									<span id="empty" class="counter " data-from="0" data-to="21" data-speed="5000" data-refresh-interval="50">0</span>
									<span class="counter-label">雇主</span>

								</div>
							</div>
							<div class="col-md-3 col-sm-6 animate-box fadeInUp animated-fast">
								<div class="feature-center">
									<span class="icon">
									<i class="layui-icon layui-icon-username" style="font-size: 42px;"></i>
								</span>

									<span id="server" class="counter " data-from="0" data-to="243" data-speed="5000" data-refresh-interval="50">0</span>
									<span class="counter-label">服务商</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6 animate-box fadeInUp animated-fast">
								<div class="feature-center">
									<span class="icon">
									<i class="layui-icon layui-icon-ok-circle" style="font-size: 42px;"></i>
								</span>
									<span id="work" class="counter " data-from="0" data-to="118" data-speed="5000" data-refresh-interval="50">0</span>
									<span class="counter-label">作品交易</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6 animate-box fadeInUp animated-fast">
								<div class="feature-center">
									<span class="icon">
									<i class="layui-icon layui-icon-auz" style="font-size: 42px;"></i>
								</span>

									<span id="need" class="counter " data-from="0" data-to="2166" data-speed="5000" data-refresh-interval="50">0</span>
									<span class="counter-label">需求完成</span>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--快速发布-->
		<div class="col-md-12">
			<p style="font-size: 24px;">快速发布</p>
			<div class="features-header-line-two"></div>
			<div style="margin-top: 40px;">
				<button class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal" style="width: 250px;" onclick="postWork()">发布作品</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="layui-btn layui-btn-lg  layui-btn-radius layui-btn-normal" style="width: 250px;" onclick="postNeed()">发布需求</button>
			</div>
		</div>
		<!--底部-->
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

		<!------------------------------------------------>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script type="text/javascript" src="js/isLogin.js"></script>
		<script>
			layui.use('element', function() {
				var element = layui.element;

			});

			layui.use('carousel', function() {
				var carousel = layui.carousel;
				//建造实例
				carousel.render({
					elem: '#test1',
					width: '100%', //设置容器宽度
					height: '500px',
					arrow: 'always', //始终显示箭头
					interval: 5000
					//,anim: 'updown' //切换动画方式
				});

			});
		
			function work() {
				location.href = "showWork.html";
			}
			function need() {
				location.href = "showNeed.html";
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
							panel.append("<a href="+lin.link +">"+lin.name+"</a>");
						}					 
					},
					error : function() {
						alert("请求失败！");
					}
				});
			}
			initLinker();
			//跳到发布需求界面
			function postNeed(){
				location.href="postNeedSelectType.html";
				
			}
			//跳到发布作品界面
			function postWork(){
				location.href="postWorkSelectType.html";
			}
			
			var dateMsg;
			//显示众包平台的数据
			function showCrowData(){
				$.ajax({
					url : "showCrowData.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						dateMsg = msg;
						setInterval(setDate,100);
						/* $("#empty").text(msg.emptyerCount);
						$("#server").text(msg.servierPeopleCount);
						$("#work").text(msg.workCount);
						$("#need").text(msg.needCount); */
					},
					error : function() {
						alert("请求失败！");
					}
				});
				
			}
			var time = 0;
			var timeCount = 1;
			$(window).scroll(function (){
			    if ($(window).scrollTop()>900) {
			    	if(time==0){
			    		showCrowData();
			    		
			    		 time++;
			    	}
			        //code........
			       
			    }
			});
			function setDate(){
				if(timeCount<11){
				var empty = dateMsg.emptyerCount;
				var server = dateMsg.servierPeopleCount;
				var work = dateMsg.workCount;
				var need = dateMsg.needCount;
				$("#empty").text(parseInt(timeCount*empty/10));
				$("#server").text(parseInt(timeCount*server/10));
				$("#work").text(parseInt(timeCount*work/10));
				$("#need").text(parseInt(timeCount*need/10));
				timeCount++;
				}
			}
		</script>

	</body>

</html>