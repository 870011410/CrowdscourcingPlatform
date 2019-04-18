<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
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
/* 	height: 628px;  */
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
	background-color: #8CC7B5;
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
	height: 550px;
	margin-left: 188px;
	margin-top: 42px;
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
}

.apps-box .app-item .app-icon {
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	padding: 10px 28px;
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
	position: absolute;
	margin-top: 40px;
	width: 250px;
	margin-left: 188px;
	height: 52px;
	text-align: center;
	font-weight: bold;
	border-radius: 5px;
	background-color: rgba(96, 96, 96, 0.4);
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
	min-height: 1200px;
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
		</div>
<!-- 	<div class="div-input">
		<div class="info">个人中心</div>
	</div> -->



	<div >
		<img src="img/rule.png" class="" id="" style="width:100%;"></a>
	</div>
	<div class="project-list" style="margin-buttom:30px;">
		<div class="div-title">

			<div
				style="padding-top: 12px; margin-left: 40px; color: white; font-family: '微软雅黑'; font-size: 18px;"
				id="iframe-title"></div>
		</div>
		<div >
			<div id="rules" style="width:100%;">
				<!-- 规则内容 -->
			</div>

<!-- 		<iframe id="if-right" src="" width="100%" height="100%"
				style="padding-top: 15px; border: 0px;">
			</iframe> -->
			<div style="padding:30px;" >
				
			</div>
		</div>

	</div>

	<div class="div-type">
		<div class="div-title">
			<div
				style="padding-top: 12px; text-align: center; color: white; font-family: '微软雅黑'; font-size: 20px;">
				<i class="layui-icon layui-icon-release "></i> 规则中心
			</div>
		</div>

		<div class="apps-box">
			<div class="app-item" onclick="choose(this)"
				valueSrc="ruleAboutPostNeed.html" valueTitle="需求发布规则" valueNum="2" id="initShow">
 				<div class="app-icon">
					<i class="layui-icon layui-icon-form" style="font-size: 20px; "></i>
				</div>

				<span class="app-name">需求发布规则</span>
			</div>
			<div class="app-item" onclick="choose(this)"
				valueSrc="ruleAboutBid.html" valueTitle="投标规则" valueNum="3" >
				<div class="app-icon">
					<i class="layui-icon layui-icon-form" style="font-size: 20px;"></i>
				</div>
				<span class="app-name">投标规则</span>
			</div>

		</div>
	</div>
</div>
		<!----------------------------------底部---------------------------------------->
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
		<!----------------------------------底部---------------------------------------->
	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script type="text/javascript" src="js/isLogin.js"></script>
	<script>
			layui.use('element', function() {
				var element = layui.element;
			});
			
			window.onload = function() {
				//一开始默认显示
				var e=$("#initShow");
				choose(e);
			}
			
 			function choose(e) {
					showRules(e);
/* 					alert("吴凡"); */
					
					$(e).parent("div").children("div").css('background-color',
							'white');
					$(e).parent("div").children("div").children("span").css(
							'color', 'black');
					$(e).parent("div").children("div").children("div").css(
							'color', 'black');
					$(e).css('background-color', '#63b5fb');
					$(e).children("span").css('color', 'white');
					$(e).children("div").css('color', 'white');
					$("#iframe-title").text($(e).attr("valueTitle"));

			} 
			
			//分页初始化数据
			function showRules(e) {
/* 				alert("志炆"); */
				var ruleTypeId=$(e).attr("valueNum");
				$("#rules").find(".row").remove();
				$
						.ajax({
							url : "do-showRulesAboutPostNeed.action",
							type : "post",
							data : {
								"ruleTypeId":ruleTypeId
							},
							dataType : "json",
							success : function(msg) {
								var ruleList=msg.ruleList;
								for (var i = 0; i < ruleList.length; i++) {
									var oneRule = ruleList[i];
									var num=changeNum(i);
									$("#rules").append("<div class='row' style='margin-left:40px;margin-right:40px;letter-spacing:1px;'></div>")
									var $div = $("#rules").find(".row").last();
									$div.append("<span style='font-size:18px;line-height:30px;font-family:Microsoft YaHei;'>第"+num+"条</span><br>");
									$div.append("<span style='font-size:15px;line-height: 35px;display:block;text-indent:2em;font-family:Microsoft YaHei;'>"+oneRule.content+ "</span>");
								}
							},
							error : function() {
								layer.msg('请求失败！', {
									icon : 5,
									time : 1000, //1s后自动关闭
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
							panel.append("<a href="+lin.link +">"+lin.name+"</a>");
						}					 
					},
					error : function() {
						alert("请求失败！");
					}
				});
			}
			initLinker();
			//将阿拉伯数字转换成中文
			function changeNum(i){
				i=i+1;
				var num;
				if(i==1){
					num='一';
				}else if(i==2){
					num='二';
				}else if(i==3){
					num='三';
				}else if(i==4){
					num='四';
				}else if(i==5){
					num='五';
				}else if(i==6){
					num='六';
				}else if(i==7){
					num='七';
				}else if(i==8){
					num='八';
				}else if(i==9){
					num='九';
				}else if(i==10){
					num='十';
				}else if(i==11){
					num='十一';
				}else if(i==12){
					num='十二';
				}else if(i==13){
					num='十三';
				}else if(i==14){
					num='十四';
				}else if(i==15){
					num='十五';
				}else if(i==16){
					num='十六';
				}else if(i==17){
					num='十七';
				}else if(i==18){
					num='十八';
				}else if(i==19){
					num='十九';
				}else if(i==20){
					num='二十';
				}else if(i==21){
					num='二十一';
				}else if(i==22){
					num='二十二';
				}else if(i==23){
					num='二十三';
				}else if(i==24){
					num='二十四';
				}else if(i==25){
					num='二十五';
				}
				return num;
			}
		
		</script>
</body>

</html>
