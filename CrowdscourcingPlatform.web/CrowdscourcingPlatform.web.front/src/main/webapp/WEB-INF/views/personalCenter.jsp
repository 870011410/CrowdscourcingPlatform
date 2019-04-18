<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<link rel="stylesheet" href="3rd/layui/css/global.css">
<link rel="stylesheet" href="css/footer.css">
<style type="text/css">
.project-list {
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
	box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
	position: absolute;
	margin-left: 478px;
	margin-top: 41px;
	width: 860px;
	height: 628px;
}
</style>

<style>
.div-type {
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
	box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
	position: absolute;
	width: 250px;
	height: 550px;
	margin-left: 188px;
	margin-top: 120px;
	border-radius: 2px;
}

.div-title {
	height: 50px;
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
	min-width: 220;
	width: 220px;
	margin: 7px 10px;
	margin-bottom: 16px;
	padding: 0px 0;
}

.apps-box .app-item .app-name {
	display: inline-block;
	text-align: center;
	margin: 10px 0;
	height: auto;
	font-size: 17px;
	color: black;
}

.apps-box .app-item .app-icon {
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	padding: 10px 36px;
	border-radius: 3px 0 0 3px;
	margin-top: -6px;
}

.apps-box .app-item .app-icon img {
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
	position: absolute;
	margin-top: 40px;
	width: 250px;
	margin-left: 188px;
	height: 52px;
	text-align: center;
	font-weight: bold;
	background-color: #63b5fb;
}

.info {
	display: inline-block;
	margin-top: 10px;
	font-size: 30px;
	color: white;
	font-family: "楷体";
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
.my-content{
	min-height: 700px;
}
</style>
</head>

<body style="margin-top: 60px;">
<div class="my-content">
	<div class="fly-header layui-bg-black" style="white-space: nowrap">
			<div class="layui-container-logo">
				<a href="homePage.html" style="color: #FFB800;font-size: 22px;line-height: 56px;font-family:'华文细黑'">
				<img src="img/logo.png" />
				
				<span style="color: white;font-family: '微软雅黑';">开心</span>众包</a>
				
			</div>
			<div class="layui-container-one">
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
			<div class="layui-container-two">
				<ul class="layui-nav my-ul">
					<li class="layui-nav-item">
						<a href="workTable.html" class="a-text">工作中心</a>
					</li>
					<li class="layui-nav-item">
						<a href="leagueCenter.html" class="a-text">联盟中心</a>
					</li>
					<li class="layui-nav-item" id="is-login" user="${user.id}">

						<a href="javascript:;" class="a-text"><img src="${user.src}" class="layui-nav-img" id="imgHead">我</a>

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
		</div>
		<div class="div-input">
			<img src="img/person.png" style="width: 30px; margin-top: -15px;margin-right: 10px;" />
			<div class="info">个人中心</div>
		</div>
		<div class="project-list">
			<div class="div-title">

				<div
					style="padding-top: 12px; margin-left: 50px; color: white; font-family: '微软雅黑'; font-size: 18px;"
					id="iframe-title"></div>
			</div>
			<div style="height: 563px;">
				<iframe id="if-right" src="showUserInfo.html" width="100%" height="100%"
					style="padding-top: 15px; border: 0px;"></iframe>
			</div>
		</div>
		<div class="div-type">
			<div class="div-title">

				<div
					style="padding-top: 12px; text-align: center; color: white; font-family: '微软雅黑'; font-size: 20px;">
					<i class="layui-icon layui-icon-release "></i> 个人资料
				</div>
			</div>
			<div class="apps-box">
				<div class="app-item" onclick="choose(this)" id="userInfo"
					valueSrc="showUserInfo.html" valueTitle="基本信息">
					<div class="app-icon">
						
					</div>
					<span class="app-name">基本信息</span>
				</div>
				<div class="app-item" onclick="choose(this)"
					valueSrc="accountManagement.html" valueTitle="订单管理">
					<div class="app-icon">
						
					</div>
					<span class="app-name">财务对账</span>
				</div>
				<div class="app-item" onclick="choose(this)"
					valueSrc="updatePwd.html" valueTitle="修改密码">
					<div class="app-icon">
						
					</div>
					<span class="app-name">修改密码</span>
				</div>
				<img src="img/personal.png" style="width: 198px; margin-top: 72px;margin-left: 12px;" />

			</div>
			</div>	
	</div>	
<!--------------------------------------------------------------------底部------------------------------------------------------------------>
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
<!---------------------------------------------------------------------------底部-------------------------------------------------------------->
			
			<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
			<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
			<script type="text/javascript" src="js/isLogin.js"></script>
	<script>
				layui.use('element', function() {
					var element = layui.element;
				});

				var src = "";

				//设置个人中心默认被选中
				$("#userInfo").css('background-color', '#63b5fb');
				$("#userInfo").children("span").css('color', 'white');
				
				
				function choose(e) {
					if ($(e).css('background-color') == 'rgb(99, 181, 251)') {
						//刷新iframe
						src = $(e).attr("valueSrc");
						//如果是服务商。跳转到服务商的订单管理界面
						if ("${user.type}" != "0"
								&& src == "accountManagement.html") {
							src = "accountManagementForProvider.html";
						}
						$("#if-right").attr("src", src);
						$("#iframe-title").text($(e).attr("valueTitle"));
					} else {
						$(e).parent("div").children("div").css(
								'background-color', 'white');
						$(e).parent("div").children("div").children("span")
								.css('color', 'black');
						$(e).css('background-color', '#63b5fb');
						$(e).children("span").css('color', 'white');
						//跳转
						src = $(e).attr("valueSrc");
						//如果是服务商。跳转到服务商的订单管理界面
						if ("${user.type}" != "0"
								&& src == "accountManagement.html") {
							src = "accountManagementForProvider.html";
						}
						$("#if-right").attr("src", src);
						$("#iframe-title").text($(e).attr("valueTitle"));
					}
				}

				//刷新iframe
				function refresh() {
					$("#if-right").attr("src", "showUserInfo.html");
					//刷新头像
					$("#imgHead").attr("src","${user.src}");
				}

				//弹出层
				layui.use('layer', function() {
					var layer = layui.layer; //执行一个laydate实例 
					//充值
					window.recharge = function(e) {
						layer.open({
							type : 2,
							title : false,
							shade : [ 0.8 ],
							area : [ '340px', '240px' ],
							content : 'recharge.html' //iframe的url，no代表不显示滚动条
						});
					}
					//确认充值成功
					window.confirmRecharge = function(e) {
						layer.open({
							type : 2,
							title : false,
							shade : [ 0.8 ],
							area : [ '400px', '260px' ],
							content : 'confirmRecharge.html' //iframe的url，no代表不显示滚动条
						});
					}
				});
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
	</script>
</body>

</html>
