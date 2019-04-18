<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>工作中心</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/footer.css">		
	</head>
	<style type="text/css">
		.project-up {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			position: absolute;
			margin-left: 478px;
			margin-top: 41px;
			width: 860px;
			/* height: 628px; */
		}
		
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
		
		.col-1 {
			width: 15%;
		}
		
		.col-2 {
			width: 85%;
		}
		
		.project-list .project-img {
			width: 112px;
			height: 92px;
		}
		
		.el-col {
			float: left;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
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
			background: #c2c2c2;
		}
		
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
		
		
		
		.info {
			display: inline-block;
			margin-top: 10px;
			font-size: 25px;
			color: white;
			font-family: "楷体";
		}
	</style>
	<style>
		.div-input {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			position: absolute;
			margin-top: 40px;
			width: 250px;
			margin-left: 188px;
			height: 52px;
			text-align: center;
			background-color: #63b5fb;
		}
		
		.info {
			display: inline-block;
			margin-top: 10px;
			font-size: 25px;
			color: white;
			font-family: "华文细黑";
		}
	</style>
	<style>
		.workTitle {
			font-family: "微软雅黑";
			font-size: 18px;
			margin-left:10px;
		}
		
		
		.workMoney {
			display: inline-block;
			position: absolute;
			font-family: "华文细黑";
			font-size: 22px;
			right: 50px;
			color: red;
			font-weight: bold;
		}
		
		.myBtn {
			display: inline-block;
			position: absolute;
			background-color: #FF5722;
			font-family: "华文细黑";
			font-size: 25px;
			right: 50px;
			color: white;
			font-weight: bold;
		}
		
		.myBtn:hover {
			background-color: rgba(242, 45, 0, 0.8);
		}
		
		.workUser {
			margin-top: 10px;
			color: gray;
			margin-left:10px;
		}
		
		.workType {
			margin-top: 20px;
			margin-left:10px;
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
			margin-left: 10px;
			height: 20px;
			width: 70px;
			background-color: #009688;
			line-height: 20px;
			text-align: center;
			color: white;
			border-radius: 2px;
		}
		.state {
			display: inline-block;
			margin-left: 15px;
			height: 20px;
			width: 70px;
			background-color: #01AAED;
			line-height: 20px;
			text-align: center;
			color: white;
				
		}
		
		.workdate {
			display: inline-block;
			margin-left: 15px;
			height: 20px;
			width: 70px;
			background-color: #CDB5CD;
			line-height: 20px;
			text-align: center;
			color: white;
			border-radius: 2px;
		}
		.first{
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 185px;
			margin-top: -5px;
		}
		.buy {
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 304px;
			margin-top: -5px;
		}
		
		.del {
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 384px;
			margin-top: -5px;
		}
		
		.dwon {
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 385px;
			margin-top: -5px;
		}
		.one{
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 191px;
			margin-top: -5px;
		}
		.smallOne{
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 307px;
			margin-top: -5px;
		}
		.two{
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 283px;
			margin-top: -5px;
		}
		.three{
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 375px;
			margin-top: -5px;
		}
		
		.out-workContent {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			margin: 25px 25px;
			border: 1px solid #c2c2c2;
		}
		
		.workContent {
			height: 93px;
			margin: 10px;
		}
		
		.div-bottom {
			height: 50px;
			background: #c2c2c2;
		}
		
		.zb-orderly-mark {
			position: absolute;
			top: 0;
			width: 20px;
			height: 20px;
			color: #ffffff;
			line-height: 20px;
			text-align: center;
			display: block;
			background: #7abfff;
			border-radius: 10px;
			margin-top: 6px;
		}
		
		.zb-normal-list-content {
			line-height: 32px;
			margin-left: 30px;
			margin-right: 0;
		}
		
		.zb-orderly-list {
			position: relative;
		}
		
		.content {
			padding: 16px 16px;
		}
		
		.my-button {
			height: 25px;
			line-height: 25px;
		}
		
		.layui-btn-xs i {
			font-size: 12px!important;
		}
		
		.layui-tab-title li {
			font-size: 16px;
			color: white;
		}
		
		.layui-tab-title {
			margin-top: -10px;
			padding: 9px;
			border: 0px
		}
		.zero_img{
		   
		   width:600px;
		   margin-left:125px;
		   margin-top: 230px;
		   margin-bottom: 50px;
		}
		.my-content{
			min-height: 700px;
		}
	</style>

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
		<div class="div-input">
			<img src="img/work.png" style="width: 30px; margin-top: -10px;margin-right: 10px;" />
			
			<div class="info">工作中心</div>
		</div>
		<div class="project-up">

			<div class="div-title">
				<div class="layui-tab layui-tab-brief" lay-filter="">
					<ul class="layui-tab-title" id="itemTab">
						<li class="layui-this">竞标中</li>
						<li class="">竞标结束</li>
						<li>进行中</li>
						<li>已完成</li>					

					</ul>
					<div class="layui-tab-content"></div>
				</div>
			</div>
			<!-- 显示需求的 -->
			<div class="project-list" id="needContent">

			</div>

		</div>
		<div class="div-type">
			<div class="apps-box">
				<div class="app-item" onclick="myNeed()" id="myNeed">
					<div class="app-icon"></div> <span class="app-name">我的需求</span>
				</div>
				<div class="app-item" onclick="myTender()" id="myTender">
					<div class="app-icon"></div> <span class="app-name">我的投标</span>
				</div>
				<div class="app-item" onclick="myWork()" id="myWork">
					<div class="app-icon"></div> <span class="app-name">作品相关</span>
				</div>
				<img src="img/workCenter.png" style="width: 198px; margin-top: 88px;margin-left: 20px;" />
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
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script type="text/javascript" src="js/isLogin.js"></script>
		<script>
			layui.use(['element','layer','layedit'], function() {
				var element = layui.element;

			});
			var form;
			layui.use('form', function() {
				form = layui.form;

			});
			
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 3;
			//当前页
			var index = 1;
			myNeed();
        //我的需求------------------------------------------------------------------
			function myNeed() {

				$("#myNeed").css("background-color", "#1E9FFF");
				$("#myNeed").css("color", "white");
				$("#myTender").css("background-color", "");
				$("#myTender").css("color", "");
				$("#myWork").css("background-color", "");
				$("#myWork").css("color", "");
                
                //生成菜单
                $("#itemTab").empty();
                $("#itemTab").append("<li class='layui-this' onclick='biding()'>竞标中</li>"
                +"<li class='' onclick='bided()'>竞标结束</li>"
                +"<li onclick='bideding()'>进行中</li>"
                +"<li onclick='faileNeed()'>已流标</li>"
				+"<li onclick='sucNeed()'>已完成</li>");
              
                biding();
			}
          //竞标中
          function biding(){
        	//从哪里开始
				start = 0;
				//每页的条数
				limit = 3;
				//当前页
				index = 1;
              initMyselfNeed();
        }
            function initMyselfNeed(){
            	//显示自己正在发布中的需求
                $.ajax({
					url : "showMyselfNeeding.action",
					type : "post",
					data : {
						"start":start,
						"limit":limit,
						"type":0
					},
					dataType : "json",
					success : function(msg) {
						//拿到需求
						var needs = msg.needs;
						$("#needContent").empty();
						for(var i = 0;i<needs.length;i++){
							var need = needs[i];
							var icon = chooseImg(need.nteName);
							$("#needContent").append("<div class='out-workContent'>"
									+"<div class='workContent' >"
									+"<div class='el-col col-1'>"
									+"<img alt='' class='project-img' src="
									+icon+"></a>"
									+"</div>"
			                        +"<div class='el-col col-2'>"
							        +"<div class='workTitle'>"
							        +need.title
							        +"<span class='workMoney'>"
									+"￥"+need.money
									+"</span>"		
									+"</div>"
									+"<div class='workUser'>"
								    +"<i class='layui-icon layui-icon-user'></i>"
								    +"&nbsp;&nbsp;&nbsp;"+need.userName
									+"<span style='margin-left: 20px;color:gray;'>"
									+"发布时间:"+need.createTime.substring(0,19)
									+"</span>"				
									+"</div>"
									+"<div class='workType'>"
								    +"<div class='type'>需求</div>"
									+"<div class='neetype'>"
								    +need.nteName
								    +"</div>"
									+"<div class='state'>竞标中</div>"
									+"<div class='buy'>"
									+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
									+"<i class='layui-icon layui-icon-align-center' "
									+"needId="+need.id
									+" onclick='needDeti(this)'>&nbsp;详情</i></button>"	
									+"</div>"
								    +"<div class='del'>"
								    +"<button"
								    +" needId="+need.id
								    +" onclick='delNeed(this)'"
								    +" class='layui-btn layui-btn-xs layui-btn-danger'>"
									+"<i class='layui-icon layui-icon-delete'>&nbsp;流标</i></button>"
									+"</div>"
									+"</div>"
							        +"</div>"
							        +"</div>"
						            +"</div>");
						}
						//返回回来的总条数
						var count = msg.count;
						if(count!=0){
						$("#needContent").append("<div id='page' align='center'></div>");
						}else{
							$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
						}
						//页码的处理
						layui.use('laypage', function() {
							var laypage = layui.laypage;

							laypage.render({
								//分页模块的id
								elem : 'page',
								limit : limit, //设置limit
								count : count, //设置count 从服务端得到
								curr : index, //设置当前页
								jump : function(obj, first) {

									//首次不执行
									if (!first) {
										start = (obj.limit * (obj.curr - 1));
										index = obj.curr;
										initMyselfNeed();
									}
								}
							});
						});
					},
					error : function() {
						layer.msg('请求失败！',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
            }
            
            
            //显示需求详情
              function needDeti(e){
        	   
					var needId=$(e).attr("needId");
					
				//将need选中的id保存到session中
					$.ajax({
						url : "saveNeedIdToSession.action",
						type : "post",
						data : {
							"needId":needId
							
						},
						dataType : "json",
						success : function(msg) {
							location.href="needDeti.html";
						},
						error : function() {
							alert("请求失败！");
						}
					});
				}
            //流标
		function delNeed(e){
				layer.confirm('确定流标?如有人投标！将扣除信用分！', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						layer.closeAll('dialog'); 
						
						delNeeded(e); 
					}
				);
			}
            
		function delNeeded(e){
			$.ajax({
				url : "deleteNeed.action",
				type : "post",
				data : {
					"needId":$(e).attr("needId")
					
				},
				dataType : "json",
				success : function(msg) {
					if(msg.res=="suc"){
						if(msg.type==0){
						layer.msg('流标成功！',{
							icon: 1,
						    time: 1000, //1s后自动关闭
						  });
						}else{
							layer.msg('流标成功！扣除信用分！',{
								icon: 1,
							    time: 1000, //1s后自动关闭
							  });
						}
						myNeed();
					}else{
						layer.msg('流标失败！',{
							icon: 1,
						    time: 1000, //1s后自动关闭
						  });
					}
				},
				error : function() {
					alert("请求失败！");
				}
			});
		}
   //---------------------------------------------------------------------------
   //竞标结束的-------------------------------------------------------------------
     function bided(){
     	//从哪里开始
			start = 0;
			//每页的条数
			limit = 3;
			//当前页
			index = 1;
			
       initMyselfNeeded();
 }
     function initMyselfNeeded(){
     	//显示自己正在发布中的需求
         $.ajax({
				url : "showMyselfNeeding.action",
				type : "post",
				data : {
					"start":start,
					"limit":limit,
					"type":1
				},
				dataType : "json",
				success : function(msg) {
					//拿到需求
					var needs = msg.needs;
					$("#needContent").empty();
					for(var i = 0;i<needs.length;i++){
						var need = needs[i];
						var icon = chooseImg(need.nteName);
						$("#needContent").append("<div class='out-workContent'>"
								+"<div class='workContent' >"
								+"<div class='el-col col-1'>"
								+"<img alt='' class='project-img' src="
								+icon+"></a>"
								+"</div>"
		                        +"<div class='el-col col-2'>"
						        +"<div class='workTitle'>"
						        +need.title
						        +"<span class='workMoney'>"
								+"￥"+need.money
								+"</span>"		
								+"</div>"
								+"<div class='workUser'>"
							    +"<i class='layui-icon layui-icon-user'></i>"
							    +"&nbsp;&nbsp;&nbsp;"+need.userName
								+"<span style='margin-left: 20px;color:gray;'>"
								+"发布时间:"+need.createTime.substring(0,19)
								+"</span>"				
								+"</div>"
								+"<div class='workType'>"
							    +"<div class='type'>需求</div>"
								+"<div class='neetype'>"
							    +need.nteName
							    +"</div>"
								+"<div class='state'>竞标结束</div>"
								+"<div class='buy'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"needId="+need.id
								+" onclick='needDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
							    +"<div class='del'>"
							    +"<button"
							    +" needId="+need.id
							    +" onclick='delNeed(this)'"
							    +" class='layui-btn layui-btn-xs layui-btn-danger'>"
								+"<i class='layui-icon layui-icon-delete'>&nbsp;流标</i></button>"
								+"</div>"
								+"</div>"
						        +"</div>"
						        +"</div>"
					            +"</div>");
					}
					//返回回来的总条数
					var count = msg.count;
					if(count!=0){
					$("#needContent").append("<div id='page' align='center'></div>");
					}else{
						$("#needContent").append("<img class='zero_img' src='img/empty.png'  >");
					}
					//页码的处理
					layui.use('laypage', function() {
						var laypage = layui.laypage;

						laypage.render({
							//分页模块的id
							elem : 'page',
							limit : limit, //设置limit
							count : count, //设置count 从服务端得到
							curr : index, //设置当前页
							jump : function(obj, first) {

								//首次不执行
								if (!first) {
									start = (obj.limit * (obj.curr - 1));
									index = obj.curr;
									initMyselfNeeded();
								}
							}
						});
					});
				},
				error : function() {
					layer.msg('请求失败！',{
						icon: 2,
					    time: 1000, //1s后自动关闭
					  });
				}
			});
     }
//-----------------------------------------------------------------------   
   //进行中开发的需求
   function bideding(){
	 //从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		
  initMyselfNeededing();
}
   function initMyselfNeededing(){
    	
        $.ajax({
				url : "showMyselfNeeding.action",
				type : "post",
				data : {
					"start":start,
					"limit":limit,
					"type":2
				},
				dataType : "json",
				success : function(msg) {
					//拿到需求
					var needs = msg.needs;
					$("#needContent").empty();
					for(var i = 0;i<needs.length;i++){
						var need = needs[i];
						var icon = chooseImg(need.nteName);
						var user = need.bidUserName+"(服务商)";
						var src = need.workUrl;
						var type = "开工中";
						if(need.leaId!=undefined){
							
							user=need.leaName+"(联盟)";
						}
						if(src!=undefined){
							type = "已交付";
						}
						$("#needContent").append("<div class='out-workContent'>"
								+"<div class='workContent' >"
								+"<div class='el-col col-1'>"
								+"<img alt='' class='project-img' src="
								+icon+"></a>"
								+"</div>"
		                        +"<div class='el-col col-2'>"
						        +"<div class='workTitle'>"
						        +need.title
						        +"<span class='workMoney'>"
								+"￥"+need.money
								+"</span>"		
								+"</div>"
								+"<div class='workUser'>"
							    +"<i class='layui-icon layui-icon-user'></i>"
							    +"&nbsp;&nbsp;&nbsp;中标人："+user
								+"<span style='margin-left: 20px;color:gray;'>"
								+"发布时间:"+need.createTime.substring(0,19)
								+"</span>"				
								+"</div>"
								+"<div class='workType'>"
							    +"<div class='type'>需求</div>"
								+"<div class='neetype'>"
							    +need.nteName
							    +"</div>"
								+"<div class='state'>"
								+type
								+"</div>"
								+"<div class='buy'>"
								+"<button"
								+" needId="+need.id
								+" leaId="+need.leaId
								+" bidUserId="+need.bidUserId
								+" bidId="+need.bidId
								+"  onclick='bidMeg(this)'"
								+" class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								
								+">&nbsp;投标信息</i></button>"
								+"</div>"
								+"<div class='dwon'>"
							    +"<button "
							    +" bidId="+need.bidId
							    +" leaId="+need.leaId
							    +" bidUserId="+need.bidUserId
							    +" money="+need.money
							    +" needId="+need.id
							    +" onclick='deliver(this)'"
							    +" class='layui-btn layui-btn-xs layui-btn-danger'>"
								+"<i class='layui-icon layui-icon-ok'>&nbsp;完成</i></button>"
								+"</div>"
								+"</div>"
						        +"</div>"
						        +"</div>"
					            +"</div>");
					}
					//返回回来的总条数
					var count = msg.count;
					if(count!=0){
					$("#needContent").append("<div id='page' align='center'></div>");
					}else{
						$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
					}
					//页码的处理
					layui.use('laypage', function() {
						var laypage = layui.laypage;

						laypage.render({
							//分页模块的id
							elem : 'page',
							limit : limit, //设置limit
							count : count, //设置count 从服务端得到
							curr : index, //设置当前页
							jump : function(obj, first) {

								//首次不执行
								if (!first) {
									start = (obj.limit * (obj.curr - 1));
									index = obj.curr;
									initMyselfNeededing();
								}
							}
						});
					});
				},
				error : function() {
					layer.msg('请求失败！',{
						icon: 2,
					    time: 1000, //1s后自动关闭
					  });
				}
			});
    }
   //查看投标信息
   //弹出层
				layui.use('layer', function() {
					var layer = layui.layer;//执行一个laydate实例 
					//详情
					window.bidMeg = function(e) {
						//判断投标人是联盟还是服务商
						var leaId = $(e).attr("leaId").trim();
						var bidUserId = $(e).attr("bidUserId").trim();
						//id
						var id = bidUserId;
						//url
						var jumpUrl="bidMegAfoot.html";
						
						if(leaId!="undefined"){
							id = leaId;
							jumpUrl="bidLeagueMeg.html";
							}
						layer.open({
							type: 2,
							title: false,
							shade: [0.2],
							area: ['620px', '670px'],
							content: jumpUrl, //iframe的url，no代表不显示滚动条
							success: function(layero, index) {
								var data=new Array();
								data[0]=leaId;//自己的数据存进去
								data[1]=bidUserId;
								data[2]=$(e).attr("bidId");
								var body=layer.getChildFrame('body',index);//确定两个界面父子关系
								var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
								iframeWin.inputDataHandle(data);
							}

						});
					}
				})
				
		//投标完成交付
		function deliver(e){
				layer.confirm('确定需求已完成?将支付报酬！', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						layer.closeAll('dialog'); 
						
						delivered(e); 
					}
				);
			}
      function delivered(e){
    	  
    	  var leaId = $(e).attr("leaId").trim();
    	  
    	  if(leaId=="undefined"){
    		  //服务商完成
    		  $.ajax({
  				url : "deliverSingle.action",
  				type : "post",
  				data : {
  					"bidId" : $(e).attr("bidId"),
  					"bidUserId" : $(e).attr("bidUserId"),
  					"money" : $(e).attr("money"),
  					"needId": $(e).attr("needId")
  				},
  				dataType : "json",
  				success : function(msg) {
                    if(msg.res=="suc"){
                    	layer.msg('交易成功！支付'+$(e).attr("money")+'元。'+'余额'+msg.money+'元！', {
      						icon : 1,
      						time : 3000, //20s后自动关闭
      					});
                    	bideding();
                    }else if(msg.res=="noMoney"){
                    	layer.msg('余额不足请充值！', {
      						icon : 2,
      						time : 1000, //20s后自动关闭
      					});
                    }else{
                    	layer.msg('操作失败！', {
      						icon : 2,
      						time : 1000, //20s后自动关闭
      					});
                    }
  				},
  				error : function() {
  					layer.msg('请求失败！', {
  						icon : 2,
  						time : 1000, //20s后自动关闭
  					});
  				}
  			});
    	  }else{
    		//联盟完成
    		  $.ajax({
  				url : "deliverLeagure.action",
  				type : "post",
  				data : {
  					"bidId" : $(e).attr("bidId"),
  					"leaId" : $(e).attr("leaId"),
  					"money" : $(e).attr("money"),
  					"needId": $(e).attr("needId")
  				},
  				dataType : "json",
  				success : function(msg) {
                    if(msg.res=="suc"){
                    	layer.msg('交易成功！支付'+$(e).attr("money")+'元。'+'余额'+msg.money+'元！', {
      						icon : 1,
      						time : 3000, //20s后自动关闭
      					});
                    	bideding();
                    }else if(msg.res=="noMoney"){
                    	layer.msg('余额不足请充值！', {
      						icon : 2,
      						time : 1000, //20s后自动关闭
      					});
                    }else{
                    	layer.msg('操作失败！', {
      						icon : 2,
      						time : 1000, //20s后自动关闭
      					});
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
      
      } 
//----------------------------------------------------------------------------------   
//流标的需求
function faileNeed(){
     	//从哪里开始
			start = 0;
			//每页的条数
			limit = 3;
			//当前页
			index = 1;
			
       initMyselfFaileNeed();
       
 }
 //显示已流标的需求
 function initMyselfFaileNeed(){
	
     $.ajax({
			url : "showMyselfNeeding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"type":3
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"发布时间:"+need.createTime.substring(0,19)
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>已流标</div>"
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyselfFaileNeed();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
	 
 }
 //---------------------------------------------------------------------------
//已完成-------------------------------------------------------------------
 //已完成的需求
function sucNeed(){
     	//从哪里开始
			start = 0;
			//每页的条数
			limit = 3;
			//当前页
			index = 1;
			
       initMyselfSucNeed();
       
 }
 //显示已完成的需求
 function initMyselfSucNeed(){
	
     $.ajax({
			url : "showMyselfNeeding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"type":4
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"发布时间:"+need.createTime.substring(0,19)
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>已完成</div>"
							+"<div class='dwon'>"
						    +"<button "
						    +" class='layui-btn layui-btn-xs layui-btn-danger'>"
							+"<i class='layui-icon layui-icon-download-circle'>&nbsp;"
							+"<a href='"
							+need.workUrl
							+"' style='color:white;'>下载</a>"
							+"</i></button>"
							+"</div>"
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyselfSucNeed();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
	 
 }
 //---------------------------------------------------------------------------
 //我的投标--------------------------------------------------------------------
			function myTender() {

				$("#myTender").css("background-color", "#1E9FFF");
				$("#myTender").css("color", "white");
				$("#myNeed").css("background-color", "");
				$("#myNeed").css("color", "");
				$("#myWork").css("background-color", "");
				$("#myWork").css("color", "");
				
				//生成菜单
                $("#itemTab").empty();
                $("#itemTab").append("<li class='layui-this' onclick='myTender()'>竞标中</li>"
                +"<li class='' onclick='myBided()'>竞标结束</li>"
                +"<li onclick='myBidedWin()'>进行中</li>"
                +"<li onclick='myBidedFail()'>已流标</li>"
				+"<li onclick='myBidedSuc()'>已完成</li>"
				+"<li onclick='myBidedFailed()'>竞标失败</li>");
              //从哪里开始
				start = 0;
				//每页的条数
				limit = 3;
				//当前页
				index = 1;
				//投标中的
               initBiding();
			}
         //我的投标正在进行的
			function initBiding(){
				$.ajax({
					url : "showMyselfBiding.action",
					type : "post",
					data : {
						"start":start,
						"limit":limit,
						"nState":0,
						"state":0,
						"type":0
					},
					dataType : "json",
					success : function(msg) {
						//拿到需求
						var needs = msg.needs;
						$("#needContent").empty();
						for(var i = 0;i<needs.length;i++){
							var need = needs[i];
							var icon = chooseImg(need.nteName);
							$("#needContent").append("<div class='out-workContent'>"
									+"<div class='workContent' >"
									+"<div class='el-col col-1'>"
									+"<img alt='' class='project-img' src="
									+icon+"></a>"
									+"</div>"
			                        +"<div class='el-col col-2'>"
							        +"<div class='workTitle'>"
							        +need.title
							        +"<span class='workMoney'>"
									+"￥"+need.money
									+"</span>"		
									+"</div>"
									+"<div class='workUser'>"
								    +"<i class='layui-icon layui-icon-user'></i>"
								    +"&nbsp;&nbsp;&nbsp;"+need.userName
									+"<span style='margin-left: 20px;color:gray;'>"
									+"联系电话:"+need.userPhone
									+"</span>"				
									+"</div>"
									+"<div class='workType'>"
								    +"<div class='type'>需求</div>"
									+"<div class='neetype'>"
								    +need.nteName
								    +"</div>"
									+"<div class='state'>竞标中</div>"
									+"<div class='buy'>"
									+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
									+"<i class='layui-icon layui-icon-align-center' "
									+"needId="+need.id
									+" onclick='needDeti(this)'>&nbsp;详情</i></button>"	
									+"</div>"
								    +"<div class='del'>"
								    +"<button"
								    +" bidId="+need.bidId
								    +" onclick='delBid(this)'"
								    +" class='layui-btn layui-btn-xs layui-btn-danger'>"
									+"<i class='layui-icon layui-icon-close'>&nbsp;取消</i></button>"
									+"</div>"
									+"</div>"
							        +"</div>"
							        +"</div>"
						            +"</div>");
						}
						//返回回来的总条数
						var count = msg.count;
						if(count!=0){
						$("#needContent").append("<div id='page' align='center'></div>");
						}else{
							$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
						}
						//页码的处理
						layui.use('laypage', function() {
							var laypage = layui.laypage;

							laypage.render({
								//分页模块的id
								elem : 'page',
								limit : limit, //设置limit
								count : count, //设置count 从服务端得到
								curr : index, //设置当前页
								jump : function(obj, first) {

									//首次不执行
									if (!first) {
										start = (obj.limit * (obj.curr - 1));
										index = obj.curr;
										initBiding();
									}
								}
							});
						});
					},
					error : function() {
						layer.msg('请求失败！',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
				
			}
			//投标取消
			function delBid(e){
					layer.confirm('确定取消该投标！', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							layer.closeAll('dialog'); 
							
							delBided(e); 
						}
					);
				}
			function delBided(e){
				
				$.ajax({
	  				url : "delMyselfBided.action",
	  				type : "post",
	  				data : {
	  					"bidId" : $(e).attr("bidId")
	  				},
	  				dataType : "json",
	  				success : function(msg) {
	  					if(msg.res=="suc"){
	  						layer.msg('取消成功！', {
		  						icon : 1,
		  						time : 1000, //20s后自动关闭
		  					});
	  						myTender();
	  					}else{
		  						layer.msg('取消失败！', {
			  						icon : 2,
			  						time : 1000, //20s后自动关闭
			  					});
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
 //------------------------------------------------------------------------------
 //我的竞标结束的投标----------------------------------------------------------
     function myBided(){
	//从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		//投标中的
    initMyBided();
    }
 
    function initMyBided(){
    	$.ajax({
			url : "showMyselfBiding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"nState":0,
				"state":0,
				"type":1
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"联系电话:"+need.userPhone
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>竞标结束</div>"
							+"<div class='buy'>"
							+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
							+"<i class='layui-icon layui-icon-align-center' "
							+"needId="+need.id
							+" onclick='needDeti(this)'>&nbsp;详情</i></button>"	
							+"</div>"
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyBided();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
    	
    }
    //----------------------------------------------------------------------
    //中标的
    function myBidedWin(){
    	//从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		//投标中的
    initMyBidedWin();
    	
    }
    
    function initMyBidedWin(){
    	$.ajax({
			url : "showMyselfBiding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"nState":3,
				"state":1,
				"type":2
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					var needUrl=need.workUrl;
					var btn = "";
					var type = "已交付";
					if(needUrl==undefined){
						btn="<div class='dwon'>"
					    +"<button "
					    +" needId="+need.id
					    +" onclick='upload(this)'"
					    +" class='layui-btn layui-btn-xs layui-btn-danger'>"
						+"<i class='layui-icon layui-icon-upload'>&nbsp;提交</i></button>"
						+"</div>";
						type="中标";
					}
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"联系电话:"+need.userPhone
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>"
							+type
							+"</div>"
							+btn
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyBidedWin();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
    }
    //弹出层
    //提交完成的需求文件----
   
    	layui.use('layer', function() {
			var layer = layui.layer;//执行一个laydate实例 
			//详情
			window.upload = function(e) {
				//需求id
				var uploadId = $(e).attr("needId").trim();
				
				layer.open({
					type: 2,
					title: false,
					shade: [0.2],
					area: ['500px', '450px'],
					content:"uploadNeedFile.html" , //iframe的url，no代表不显示滚动条
					success: function(layero, index) {
						var data=new Array();
						data[0]=uploadId;//自己的数据存进去
						var body=layer.getChildFrame('body',index);//确定两个界面父子关系
						var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
						iframeWin.inputDataHandle(data);
					}

				});
			}
		})
    	
    //------------------------------------------------------------------
    //流标的
    function myBidedFail(){
    	//从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		//投标中的
    initMyBidedFail();
    	
    }
    
    function initMyBidedFail(){
    	$.ajax({
			url : "showMyselfBiding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"nState":5,
				"state":0,
				"type":3
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"联系电话:"+need.userPhone
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>流标</div>"
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyBidedFail();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
    }
    //---------------------------------------------------------------------
    //完成的---------------------------------------------------------------
    function myBidedSuc(){
    	//从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		//投标中的
    initMyBidedSuc();
    	
    }
    
    function initMyBidedSuc(){
    	$.ajax({
			url : "showMyselfBiding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"nState":4,
				"state":2,
				"type":4
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"联系电话:"+need.userPhone
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>需求完成</div>"
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyBidedSuc();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
    }
    
    //投标失败的-------------------------------------------------------------------
    function myBidedFailed(){
    	//从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		//投标中的
    initMyBidedFailed();
    	
    }
    
    function initMyBidedFailed(){
    	$.ajax({
			url : "showMyselfBiding.action",
			type : "post",
			data : {
				"start":start,
				"limit":limit,
				"nState":3,
				"state":0,
				"type":5
			},
			dataType : "json",
			success : function(msg) {
				//拿到需求
				var needs = msg.needs;
				$("#needContent").empty();
				for(var i = 0;i<needs.length;i++){
					var need = needs[i];
					var icon = chooseImg(need.nteName);
					$("#needContent").append("<div class='out-workContent'>"
							+"<div class='workContent' >"
							+"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="
							+icon+"></a>"
							+"</div>"
	                        +"<div class='el-col col-2'>"
					        +"<div class='workTitle'>"
					        +need.title
					        +"<span class='workMoney'>"
							+"￥"+need.money
							+"</span>"		
							+"</div>"
							+"<div class='workUser'>"
						    +"<i class='layui-icon layui-icon-user'></i>"
						    +"&nbsp;&nbsp;&nbsp;"+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"发布时间:"+need.createTime
							+"</span>"				
							+"</div>"
							+"<div class='workType'>"
						    +"<div class='type'>需求</div>"
							+"<div class='neetype'>"
						    +need.nteName
						    +"</div>"
							+"<div class='state'>竞标失败</div>"
							+"</div>"
					        +"</div>"
					        +"</div>"
				            +"</div>");
				}
				//返回回来的总条数
				var count = msg.count;
				if(count!=0){
				$("#needContent").append("<div id='page' align='center'></div>");
				}else{
					$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
				}
				//页码的处理
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					laypage.render({
						//分页模块的id
						elem : 'page',
						limit : limit, //设置limit
						count : count, //设置count 从服务端得到
						curr : index, //设置当前页
						jump : function(obj, first) {

							//首次不执行
							if (!first) {
								start = (obj.limit * (obj.curr - 1));
								index = obj.curr;
								initMyBidedFailed();
							}
						}
					});
				});
			},
			error : function() {
				layer.msg('请求失败！',{
					icon: 2,
				    time: 1000, //1s后自动关闭
				  });
			}
		});
    }
    //作品栏内容---------------------------------------------------------------------------------------
   		 //发布的作品
		function myWork() {
			$("#myWork").css("background-color", "#1E9FFF");
			$("#myWork").css("color", "white");
			$("#myNeed").css("background-color", "");
			$("#myNeed").css("color", "");
			$("#myTender").css("background-color", "");
			$("#myTender").css("color", "");

              //生成菜单
               $("#itemTab").empty();
               $("#itemTab").append("<li class='layui-this' onclick='findMyWork()'>发布的作品</li>"
               +"<li onclick='findBuyerWork()'>购买的作品</li>");
               findMyWork();
		}
	 	//我发布的作品
         function findMyWork(){
       	//从哪里开始
			start = 0;
			//每页的条数
			limit = 3;
			//当前页
			index = 1;
			initMyWork();
       }
           function initMyWork(){
        	 $("#needContent").empty();
        	 
           	//显示自己正在发布的作品
               $.ajax({
				url : "initMyWork.action",
				type : "post",
				data : {
					"start":start,
					"limit":limit,
					"state":0	//0下架  1上架  2待付款 3确认收货 4交易成功 5已发货 8删除 9待审核 10审核不通过
				},
				dataType : "json",
				success : function(msg) {
					//拿到作品
					var works = msg.works;
					
					for(var i = 0;i<works.length;i++){
						var work = works[i];
						
						var state="";
						var content="";
						if(work.state==0){
							state="已下架"
							content="<div class='first'>"
							+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
							+"<i class='layui-icon layui-icon-align-center' "
							+"workId="+work.id
							+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
							+"</div>"
							+"<div class='buy'>"
							+"<button class='layui-btn layui-btn-xs layui-btn-warm'"
							+" workId="+work.id
							+" onclick='updateState(this)' state=1>"
							+"<i class='layui-icon layui-icon-up'>&nbsp;上架</i>"
							+"</button>"
							+"</div>"
						    +"<div class='del'>"
						    +"<div class='content' style='display: none;'>"+work.content+"</div>"
						    +" <button"
						    +" workId="+work.id
						    +" workTitle="+work.title
						    +" workMoney="+work.money
						    +" workType="+work.type
						    +" workImg="+work.src 
						    +" onclick='motifyWork(this)'"
						    +" class='layui-btn layui-btn-xs '>"
							+"<i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button>"
							+"</div>"
							+"<div class='dwon'>"
							+"<button"
						    +" workId="+work.id
						    +" onclick='updateState(this)'"
						    +" class='layui-btn layui-btn-xs layui-btn-danger' state=8>"
							+"<i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button>"
						}
						if(work.state==1){
							state="已上架"
							content="<div class='del'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"workId="+work.id
								+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
								+"<div class='dwon'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-warm'"
								+" workId="+work.id
								+" onclick='updateState(this)' state=0>"
								+"<i class='layui-icon layui-icon-down'>&nbsp;下架</i>"
								+"</button>"
								+"</div>"
								    
						   
						}
						if(work.state==2){
						
							state="已付款";
							content="<div class='buy'>"
							+"<button class='layui-btn layui-btn-xs layui-bg-blue' style='background-color:#F08080;'>"
							+"<i class='layui-icon layui-icon-upload-drag' "
							+"workId="+work.id
							+" onclick='upWorkload(this)'>&nbsp;上传</i></button>"	
							+"</div>"
							+"<div class='dwon'>"
							+"<button class='layui-btn layui-btn-xs layui-btn-danger'"
							+" workId="+work.id
							+" buyerId="+work.buyerId
						    +" workMoney="+work.money
							+" onclick='returnMoney(this)' state=0>"
							+"<i class='layui-icon layui-icon-rmb'>&nbsp;退款</i>"
							+"</button>"
							+"</div>"
						}
						if(work.state==3){
							state="交易成功";
							content="<div class='dwon'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"workId="+work.id
								+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
								
								
									
						}
						if(work.state==5){
							state="已发货";
							content="<div class='del'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"workId="+work.id
								+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
								+"<div class='dwon'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-danger'"
								+" workId="+work.id
								+" buyerId="+work.buyerId
							    +" workMoney="+work.money
								+" onclick='returnMoney(this)' state=0>"
								+"<i class='layui-icon layui-icon-rmb'>&nbsp;退款</i>"
								+"</button>"
								+"</div>"
								
								
									
						}
						if(work.state==9){
							state="待审核"
							content="<div class='dwon'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"workId="+work.id
								+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
							
						}
						if(work.state==10){
							state="审核不通过"
							content="<div class='del'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"workId="+work.id
								+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
								+"<div class='dwon'>"
								+"<button"
							    +" workId="+work.id
							    +" onclick='updateState(this)'"
							    +" class='layui-btn layui-btn-xs layui-btn-danger' state=8>"
								+"<i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button>";
						}
					
						var icon = chooseImg(work.neeName);
						$("#needContent").append("<div class='out-workContent'>"
								+"<div class='workContent' >"
								+"<div class='el-col col-1'>"
								+"<img alt='' class='project-img' src="
								+icon+"></a>"
								+"</div>"
		                        +"<div class='el-col col-2'>"
						        +"<div class='workTitle'>"
						        +work.title
						        +"<span class='workMoney'>"
								+"￥"+work.money
								+"</span>"		
								+"</div>"
								+"<div class='workUser'>"
							    +"<i class='layui-icon layui-icon-user'></i>"
							    +"&nbsp;&nbsp;&nbsp;"+work.useName
								+"<span style='margin-left: 20px;color:gray;'>"
								+"发布时间:"+work.createTime.substring(0,19)
								+"</span>"				
								+"</div>"
								+"<div class='workType'>"
							    +"<div class='type'>作品</div>"
								+"<div class='neetype'>"
							    +work.neeName
							    +"</div>"
								+"<div class='state'>"+state+"</div>"
								+content+"</div>"
								+"</div>"
						        +"</div>"
						        +"</div>"
					            +"</div>");
					}
					//返回回来的总条数
					var count = msg.count;
					
					if(count!=0){
					$("#needContent").append("<div id='page' align='center'></div>");
					}else{
						$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
					}
					//页码的处理
					layui.use('laypage', function() {
						var laypage = layui.laypage;

						laypage.render({
							//分页模块的id
							elem : 'page',
							limit : limit, //设置limit
							count : count, //设置count 从服务端得到
							curr : index, //设置当前页
							jump : function(obj, first) {

								//首次不执行
								if (!first) {
									start = (obj.limit * (obj.curr - 1));
									index = obj.curr;
									initMyWork();
								}
							}
						});
					});
				},
				error : function() {
					layer.msg('请求失败！',{
						icon: 2,
					    time: 1000, //1s后自动关闭
					  });
				}
			});
           } 
           //弹出层
           //提交作品文件----
          
           	layui.use('layer', function() {
       			var layer = layui.layer;//执行一个laydate实例 
       			//详情
       			window.upWorkload = function(e) {
       				//需求id
       				var workId = $(e).attr("workId").trim();
       				
       				layer.open({
       					type: 2,
       					title: false,
       					shade: [0.2],
       					area: ['500px', '400px'],
       					content:"uploadWorkFile.html" , //iframe的url，no代表不显示滚动条
       					success: function(layero, index) {
       						var data=new Array();
       						data[0]=workId;//自己的数据存进去
       						var body=layer.getChildFrame('body',index);//确定两个界面父子关系
       						var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
       						iframeWin.inputDataHandle(data);
       					}

       				});
       			}
       		})
         //显示作品详情
           function workDeti(e){
     	   
					var workId=$(e).attr("workId");
					
				//将need选中的id保存到session中
					$.ajax({
						url : "saveWorkIdToSession.action",
						type : "post",
						data : {
							"workId":workId
							
						},
						dataType : "json",
						success : function(msg) {
							location.href="workDeti.html";
						},
						error : function() {
							alert("请求失败！");
						}
					});
				}
         //修改状态
			function updateState(e) {
				var stateNum=$(e).attr("state");
				var workId=$(e).attr("workId");
				var stateName="";
				if(stateNum==0){
					stateName="下架";
				}
				if(stateNum==1){
					stateName="上架";
				}
				if(stateNum==8){
					stateName="删除";
				}
				
				$.ajax({
					url: "updateState.action",
					type: "post",
					data: {
						"workId": workId,
						"state": stateNum,
						"stateName":stateName
					},
					dataType: "json",
					success: function(msg) {
						if(msg.type == "SUC") {
							
							layer.msg(stateName+'作品成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							initMyWork();
						} else {
							
							layer.msg(stateName+'作品失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
			}
	        //退款
	         	function returnMoney(e){
				layer.confirm('确定给买家退款吗?', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						layer.closeAll('dialog'); 
						
						okReturnMoney(e); 
					}
				);
			}
			function okReturnMoney(e) {
				
				var workId=$(e).attr("workId");
				var buyerId=$(e).attr("buyerId");
				var workMoney = $(e).attr("workMoney");
				
			
				
				$.ajax({
					url: "returnMoney.action",
					type: "post",
					data: {
						"workId": workId,
						"buyerId": buyerId,
						"workMoney":workMoney
					},
					dataType: "json",
					success: function(msg) {
						if(msg.type == "SUC") {
							
							layer.msg('退款成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							initMyWork();
						}else if(msg.type == "NotLogin"){
							location.href="login.html";
						}else{
							layer.msg(msg.type,{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						
						

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
			}
			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例 
				//详情
				window.motifyWork = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['800px', '700px'],
						content: 'updateWork.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							data[0]=$(e).attr("workId");
							data[1]=$(e).attr("workTitle");
							data[2]=$(e).attr("workMoney");
							data[3]=$(e).attr("workType");
							data[4]=$(e).parent().find(".content").html();
							data[5]=$(e).attr("workImg");
							
							
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data);
						}

					});
				}
			});
//作品栏内容---------------------------------------------------------------------------------------
	   		 //购买的作品
	
	         function findBuyerWork(){
	       	//从哪里开始
				start = 0;
				//每页的条数
				limit = 3;
				//当前页
				index = 1;
				initBuyerWork();
				
	       }
	           function initBuyerWork(){
	        	 $("#needContent").empty();
	           	//显示自己正在发布的作品
	               $.ajax({
					url : "initBuyerWork.action",
					type : "post",
					data : {
						"start":start,
						"limit":limit,
						"state":0	//0下架  1上架   2已付款3交易成功 8删除 9锁定
					},
					dataType : "json",
					success : function(msg) {
						//拿到作品
						var works = msg.works;
						
						for(var i = 0;i<works.length;i++){
							var work = works[i];
							var state="";
							var content="";
							if(work.state==2){
								state="待发货"
								content="<div class='smallOne'>"
								+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
								+"<i class='layui-icon layui-icon-align-center' "
								+"workId="+work.id
								+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
								+"</div>"
								+"<div class='three'>"
								+"<button"
							    +" workId="+work.id
							    +" phone="+work.phone
							    +" onclick='call(this)'"
							    +" class='layui-btn layui-btn-xs layui-btn-danger' state=8>"
								+"<i class='layui-icon layui-icon-rmb'>&nbsp;退货退款</i></button>"
							   
							}
							if(work.state==3){
								state="交易成功"
								content="<div class='smallOne'>"
									+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
									+"<i class='layui-icon layui-icon-align-center' "
									+"workId="+work.id
									+" onclick='workDeti(this)'>&nbsp;详情</i></button>"	
									+"</div>"
									+"<div class='three'>"
									+"<button class='layui-btn layui-btn-xs layui-btn-normal layui-bg-blue' >"
									+"<i class='layui-icon layui-icon-download-circle' "
									+" workId="+work.id
									+" workSrc='"+work.fileSrc
									+"' onclick='down(this)'>&nbsp;下载作品</i></button>"
									+"</div>"
									
	
							}
							if(work.state==5){
								state="待收货"
								content="<div class='one'>"
									+"<button class='layui-btn layui-btn-xs layui-btn-normal layui-bg-blue' >"
									+"<i class='layui-icon layui-icon-download-circle' "
									+" workId="+work.id
									+" workSrc='"+work.fileSrc
									+"' onclick='down(this)'>&nbsp;下载作品</i></button>"
									+"</div>"
									+"<div class='two'>"
								    +"<div class='content' style='display: none;'>"+work.content+"</div>"
								    +" <button"
								    +" workId="+work.id
								    +" workTitle="+work.title
								    +" workMoney="+work.money
								    +" workType="+work.type
								    +" workImg="+work.src 
								    +" onclick='okBuy(this)'"
								    +" class='layui-btn layui-btn-xs '>"
									+"<i class='layui-icon layui-icon-edit'>&nbsp;确认收货</i></button>"
									+"</div>"
									+"<div class='three'>"
									+"<button"
								    +" workId="+work.id
								    +" phone="+work.phone
								    +" onclick='call(this)'"
								    +" class='layui-btn layui-btn-xs layui-btn-danger' state=8>"
									+"<i class='layui-icon layui-icon-rmb'>&nbsp;退货退款</i></button>"
	
							}

						
							var icon = chooseImg(work.neeName);
							$("#needContent").append("<div class='out-workContent'>"
									+"<div class='workContent' >"
									+"<div class='el-col col-1'>"
									+"<img alt='' class='project-img' src="
									+icon+"></a>"
									+"</div>"
			                        +"<div class='el-col col-2'>"
							        +"<div class='workTitle'>"
							        +work.title
							        +"<span class='workMoney'>"
									+"￥"+work.money
									+"</span>"		
									+"</div>"
									+"<div class='workUser'>"
								    +"<i class='layui-icon layui-icon-user'></i>"
								    +"&nbsp;&nbsp;&nbsp;"+work.useName
									+"<span style='margin-left: 20px;color:gray;'>"
									+"发布时间:"+work.createTime.substring(0,19)
									+"</span>"				
									+"</div>"
									+"<div class='workType'>"
								    +"<div class='type'>作品</div>"
									+"<div class='neetype'>"
								    +work.neeName
								    +"</div>"
									+"<div class='state'>"+state+"</div>"
									+content+"</div>"
									+"</div>"
							        +"</div>"
							        +"</div>"
						            +"</div>");
						}
						//返回回来的总条数
						var count = msg.count;
						
						if(count!=0){
						$("#needContent").append("<div id='page' align='center'></div>");
						}else{
							$("#needContent").append("<img class='zero_img' src='img/empty.png'  >")
						}
						//页码的处理
						layui.use('laypage', function() {
							var laypage = layui.laypage;

							laypage.render({
								//分页模块的id
								elem : 'page',
								limit : limit, //设置limit
								count : count, //设置count 从服务端得到
								curr : index, //设置当前页
								jump : function(obj, first) {

									//首次不执行
									if (!first) {
										start = (obj.limit * (obj.curr - 1));
										index = obj.curr;
										initBuyerWork();
									}
								}
							});
						});
					},
					error : function() {
						layer.msg('请求失败！',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
	           } 
	       	function okBuy(e){
				layer.confirm('确定确认收货吗?', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						layer.closeAll('dialog'); 
						
						sureBuy(e); 
					}
				);
			}
	         //确认收货
				function sureBuy(e) {
					
					var workId=$(e).attr("workId");
					$.ajax({
						url: "okBuy.action",
						type: "post",
						data: {
							"workId": workId
						},
						dataType: "json",
						success: function(msg) {
							if(msg.type == "SUC") {
								
								layer.msg("确认收货成功！",{
									icon: 6,
								    time: 1000, //1s后自动关闭
								  });
								initBuyerWork();
							} else {
								
								layer.msg(msg.type,{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}

						},
						error: function() {
							layer.msg('请求失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
					});
				} 
	         //下载作品
	         function down(e) {
	        	 
	        	 window.location.href=$(e).attr("workSrc");
			}
	         //打卖家电话 
	         function call(e) {
	        	 alert($(e).attr("phone"));
	        	 layer.confirm('退款请拨打卖家电话<br/>号码:'+$(e).attr("phone"), {
					  btn: ['确定','取消'] //按钮
					}, function(){
						layer.closeAll('dialog'); 
						
						
					}
				);
			}
			//判断需求的文字信息 选择图标
    		function chooseImg(str){
			var textDb = ["机械设计","硬件开发","游戏开发","漫画设计","动画设计","景观园林","效果图","电商经营","电商营销","电商运营","展厅服务","家装服务","公装服务","产品/UI","移动开发","网站建设","特色营销","地推","媒介投放","名片广告","VI","LOGO","手机","通讯","H5","HTML","微信","企业","WEB","web",
				"桌面","嵌入式","游戏","培训","链","智能","数据","物联网","云",
				"java","软件","影视","电影","视频","动画","营销","金融","电商",
				"工程","设计","技术","开发","服务"];
			var imgDb = ["img/needType/jixiesheji.png","img/needType/yingjiankaifa.png","img/needType/youxikaifa.png","img/needType/manhuasheji.png","img/needType/donghuasheji.png","img/needType/jingguanyuanling.png","img/needType/xiaoguotu.png","img/needType/dianshangjinying.png","img/needType/dianshangyingxiao.png","img/needType/dianshangyunying.png","img/needType/zhangtingfuwu.png","img/needType/jiazhuangfuwu.png","img/needType/gongzhuangfuwu.png","img/needType/cahngpingui.png","img/needType/yidongkaifa.png","img/needType/wangzhanjianshe.png","img/needType/tesheyinxiao.png","img/needType/ditiu.png","img/needType/meijietoufang.png","img/needType/pingpaisheji.png","img/needType/vi.png","img/needType/logo.png","img/need/ste1.png","img/need/ste1.png","img/need/434.png","img/need/434.png",
				"img/need/435.png","img/need/436.png","img/need/437.png","img/need/437.png",
				"img/need/439.png","img/need/440.png","img/need/441.png","img/need/443.png",
				"img/need/445.png","img/need/446.png","img/need/447.png",
				"img/need/448.png","img/need/449.png","img/need/java.png","img/need/ruanjian.png",
				"img/need/yinshi.png","img/need/yinshi.png","img/need/yinshi.png","img/need/yinshi.png",
				"img/need/yingxiao.png","img/need/yingxiao.png","img/need/dianshang.png",
				"img/need/438.png","img/need/442.png","img/need/442.png","img/need/kaifa.png","img/need/fuwu.png"];
			for(var i=0;i<textDb.length;i++){
				if(str.indexOf(textDb[i]) != -1 ){
					return imgDb[i];
				}
			}
			
			return "img/need/wenhao.png";
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
		</script>

	</body>

</html>
    