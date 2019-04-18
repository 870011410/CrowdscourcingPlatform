<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style type="text/css">
			.project-list>.el-row {
				width: auto;
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-webkit-box-orient: horizontal;
				-webkit-box-direction: normal;
				-ms-flex-direction: row;
				flex-direction: row;
				-webkit-box-pack: center;
				-ms-flex-pack: center;
				justify-content: center;
				-ms-flex-wrap: nowrap;
				flex-wrap: nowrap;
				padding: 16px;
				margin: 16px 0
			}
			
			.project-list .row-shadow {
				background: #fff;
				border-radius: 3px;
				-webkit-box-shadow: 0 0 10px 0 rgba(0, 0, 0, .12), 0 0 10px 0 rgba(0, 0, 0, .12);
				box-shadow: 0 0 10px 0 rgba(0, 0, 0, .12), 0 0 10px 0 rgba(0, 0, 0, .12)
			}
			
			.project-list .row-shadow:hover {
				-webkit-box-shadow: 0 1px 14px 0 #999;
				box-shadow: 0 1px 14px 0 #999
			}
			
			.project-list {
				position: absolute;
				margin-left: 478px;
				margin-top: 20px;
				width: 860px;
			}
			
			.col-1 {
				width: 21%;
			}
			
			.col-2 {
				width: 79%;
			}
			
			.project-list .project-img {
				width: 150px;
				height: 110px;
			}
			
			.el-col {
				float: left;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
			}
		</style>
		<style>
			.one-div {
				position: absolute;
				left: 25%;
				height: 50px;
			}
			
			.two-div {
				position: absolute;
				left: 1100px;
				height: 50px;
			}
			
			.my-ul {
				background-color: rgba(0, 0, 0, 0);
				height: 50px;
				white-space: nowrap;
			}
			
			.a-text {
				font-size: 18px;
				font-family: "华文细黑";
			}
			
			.div-all {
				background-color: #393D49;
				height: 60px;
				width: 100%;
			}
		</style>
		<style>
			.div-type {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
				position: absolute;
				width: 250px;
				height: 617px;
				margin-left: 188px;
				margin-top: 35px;
				border-radius: 2px;
			}
			
			.div-title {
				height: 40px;
				background: #63b5fb;
			}
		</style>
		<style>
			.apps-box {
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-webkit-box-orient: horizontal;
				-webkit-box-direction: normal;
				-ms-flex-flow: row wrap;
				flex-flow: row wrap;
				-webkit-box-pack: start;
				-ms-flex-pack: start;
				justify-content: flex-start;
				-webkit-box-align: center;
				-ms-flex-align: center;
				align-items: center;
				margin-left: 5px;
				padding-top: 14px;
			}
			
			.apps-box .app-item {
				-webkit-box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				cursor: pointer;
				border-radius: 3px;
				min-width: 100px;
				width: 100px;
				margin: 0px 10px;
				margin-bottom: 16px;
				padding: 0px 0;
			}
			.app-all{
				-webkit-box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				cursor: pointer;
				border-radius: 3px;
				min-width: 220px;
				width: 220px;
				margin: 0px 10px;
				margin-bottom: 16px;
				padding: 0px 0;
			}
			.app-name-all{
				display: inline-block;
				text-align: center;
				margin: 6px 0;
				height: auto;
				font-size: 18px;
				margin-left: 60px;
				font-family: "华文细黑";
			}
			
			.apps-box .app-item .app-name {
				display: inline-block;
				text-align: center;
				margin: 10px 0;
				height: auto;
				font-size: 12px;
			}
			
			.apps-box .app-icon {
				text-align: center;
				vertical-align: middle;
				display: inline-block;
				padding: 10px 6px;
				border-radius: 3px 0 0 3px;
			}
			
			.apps-box .app-icon img {
				height: 15px;
				width: 15px;
				border: none;
				display: block
			}
			
			.active {
				color: #2583f8
			}
			
			.div-input {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				margin-top: 40px;
				margin-left: auto;
				margin-right: auto;
				width: 900px;
				height: 50px;
			}
			
			.search-input {
				display: inline-block;
				height: 50px;
				font-size: 18px;
				font-family: "华文细黑";
				width: 700px;
				border: 0px;
			}
			
			.search-btn {
				display: inline-block;
				width: 196px;
				height: 50px;
				border: 0px;
				margin-top: -2px;
			}
		</style>
		<style>
			.workTitle {
				font-family: "微软雅黑";
				font-size: 25px;
			}
			
			.workTitle:hover {
				color: #01AAED;
			}
			
			.workMoney {
				font-family: "华文细黑";
				font-size: 25px;
				margin-left: 180px;
				color: red;
				font-weight: bold;
			}
			
			.workUser {
				margin-top: 10px;
			}
			
			.workType {
				margin-top: 20px;
			}
			
			.type {
				display: inline-block;
				height: 20px;
				width: 50px;
				background-color: #FF5722;
				line-height: 20px;
				text-align: center;
				color: white;
				border-radius: 2px;
			}
			
			.neetype {
				display: inline-block;
				margin-left: 15px;
				height: 20px;
				width: 70px;
				background-color: #009688;
				line-height: 20px;
				text-align: center;
				color: white;
				border-radius: 2px;
			}
			
			.buy {
				position: absolute;
				display: inline-block;
				width: 150px;
				margin-left: 335px;
				margin-top: -5px;
			}
		</style>
	</head>

	<body>
		<div class="div-all">
			<div class="one-div ">
				<ul class="layui-nav my-ul" lay-filter="">
					<li class="layui-nav-item">
						<a href="" class="a-text">最新活动</a>
					</li>
					<li class="layui-nav-item ">
						<a href="" class="a-text">产品</a>
					</li>
					<li class="layui-nav-item">
						<a href="" class="a-text">大数据</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" class="a-text">解决方案</a>
						<dl class="layui-nav-child">
							<!-- 二级菜单 -->
							<dd>
								<a href="">移动模块</a>
							</dd>
							<dd>
								<a href="">后台模版</a>
							</dd>
							<dd>
								<a href="">电商平台</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="" class="a-text">社区</a>
					</li>
				</ul>
			</div>

			<div class=" two-div ">
				<ul class="layui-nav my-ul">
					<li class="layui-nav-item">
						<a href="" class="a-text">控制台<span class="layui-badge">9</span></a>
					</li>
					<li class="layui-nav-item">
						<a href="" class="a-text">个人中心<span class="layui-badge-dot"></span></a>
					</li>
					<li class="layui-nav-item">
						<a href="" class="a-text"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">修改信息</a>
							</dd>
							<dd>
								<a href="javascript:;">安全管理</a>
							</dd>
							<dd>
								<a href="javascript:;">退了</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<div class="div-input">

			<input type="text" class="layui-input search-input" placeholder="输入标题，可配合需求类型搜索" />
			<button class="layui-btn layui-btn-normal search-btn "><i class="layui-icon layui-icon-search "></i> </button>

		</div>
		<div class="project-list">
			<div class="row-shadow el-row">
				<div class="el-col col-1">
					<img alt="" class="project-img" src="img/1.jpg"></a>
				</div>
				<div class="el-col col-2">
					<div class="workTitle">

						福鼎510K app棋牌开发定制
						<span class="workMoney">
						￥888
						</span>
					</div>

					<div class="workUser">
						<i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;&nbsp;诸葛亮
						<span style="margin-left: 20px;">
						发布时间：2018-12-10 
						</span>
					</div>
					<div class="workType">
						<div class="type">作品</div>
						<div class="neetype">游戏开发</div>
						<div class="buy">
							<button class="layui-btn  layui-btn-sm layui-btn-radius layui-btn-normal" style="width: 150px;font-size: 16px;">立即购买</button>
						</div>
					</div>

				</div>
			</div>

			<div class="row-shadow el-row">
				<div class="el-col col-1">
					<img alt="" class="project-img" src="img/1.jpg"></a>
				</div>
				<div class="el-col col-2">
					<div class="workTitle">

						福鼎510K app棋牌开发定制
						<span class="workMoney">
						￥888
						</span>
					</div>

					<div class="workUser">
						<i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;&nbsp;诸葛亮
						<span style="margin-left: 20px;">
						发布时间：2018-12-10 
						</span>
					</div>
					<div class="workType">
						<div class="type">作品</div>
						<div class="neetype">游戏开发</div>
						<div class="buy">
							<button class="layui-btn  layui-btn-sm layui-btn-radius layui-btn-normal" style="width: 150px;font-size: 16px;">立即购买</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row-shadow el-row">
				<div class="el-col col-1">
					<img alt="" class="project-img" src="img/1.jpg"></a>
				</div>
				<div class="el-col col-2">
				</div>
			</div>

			<div class="row-shadow el-row">
				<div class="el-col col-1">
					<img alt="" class="project-img" src="img/1.jpg"></a>
				</div>
				<div class="el-col col-2">
				</div>
			</div>

		</div>
		<div class="div-type">
			<div class="div-title">

				<div style="padding-top: 10px; text-align: center; color: white;font-family: '微软雅黑';">
					<i class="layui-icon layui-icon-release "></i> 选择需求类型
				</div>
			</div>
			<div class="apps-box">
				<div class="app-all" onclick="choose(this)" id="app-allType">
					<div class="app-icon"><img src="" alt=""></div> <span class="app-name-all">全部</span>
				</div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">移动应用</span>
				</div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">H5应用</span></div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">微信应用</span></div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">企业应用</span></div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">WEB应用</span></div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">工具应用</span></div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">桌面应用</span></div>
				<div class="app-item" onclick="choose(this)">
					<div class="app-icon"><img src="img/433.png" alt=""></div> <span class="app-name">嵌入式应用</span></div>
			</div>
			<script type="text/javascript" src="3rd/my/js/jquery-3.3.1.min.js"></script>
			<script type="text/javascript" src="3rd/layui/layui.js"></script>
			<script>
				layui.use('element', function() {
					var element = layui.element;

				});

				function choose(e) {
					if($(e).attr("id")=="app-allType"){
						$(e).parent().find(".app-item").css('background-color', 'white');
						$(e).parent().find(".app-name").css('color', 'black');
					}else{
						
						$("#app-allType").css('background-color', 'white');
						$("#app-allType").find(".app-name-all").css('color', 'black');
					}
					
					if($(e).css('background-color') == 'rgb(99, 181, 251)') {
						$(e).css('background-color', 'white');
						$(e).children("span").css('color', 'black');
						

					}else {
						$(e).css('background-color', '#63b5fb');
						$(e).children("span").css('color', 'white');
						
					}

				}
			</script>
	</body>

</html>