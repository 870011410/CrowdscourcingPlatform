<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>联盟投标管理</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="3rd/layui/css/global.css">
	</head>
	<style type="text/css">
		.project-up {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			position: absolute;
			margin-left: 0px;
			top: 0px;
			width: 850px;
			height: 628px;
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
			/*background: #c2c2c2;*/
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
			border-radius: 5px;
			background-color: #1E9FFF;
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
			border-radius: 5px;
			background-color: #1E9FFF;
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
			background-color: #c2c2c2;
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
			background-color: #c2c2c2;
			line-height: 20px;
			text-align: center;
			color: white;
			border-radius: 2px;
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
		
		.buy {
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 295px;
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
			margin-left: 384px;
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
		   margin-top: 150px;
		   margin-bottom: 50px;
		}
	</style>

	<body>
			<div class="div-title">
				<div class="layui-tab layui-tab-brief" lay-filter="">
					<ul class="layui-tab-title" id="itemTab" >
						<li class="layui-this" style="color: #000000;" onclick='myTender()'>竞标中</li>
						<li class="" style="color: #000000;" onclick="myBided()">竞标结束</li>
						<li style="color: #000000;" onclick="myBidedWin()">进行中</li>
						<li style="color: #000000;" onclick="myBidedFail()">已流标</li>
						<li style="color: #000000;" onclick="myBidedSuc()">已完成</li>
						<li style="color: #000000;" onclick="myBidedFailed()">竞标失败</li>

					</ul>
					<div class="layui-tab-content"></div>
				</div>
			</div>
			<div class="project-list" id="needContent">				

			</div>
          <span id="span" style="display:none;">${myselefLeaId}</span>

		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			layui.use(['element','layer'], function() {
				var element = layui.element;

			});
			var leaId = $("#span").text().trim();
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 3;
			//当前页
			var index = 1;
			//我的投标正在进行的
			myTender();
			function myTender(){
				start = 0;
				//每页的条数
				limit = 5;
				//当前页
				index = 1;
				initBiding();
			}
			function initBiding(){
				$.ajax({
					url : "showLeagureBiding.action",
					type : "post",
					data : {
						"leaId":leaId,
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
									+"<div class='neetype'>竞标中</div>"
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
									+"<i class='layui-icon layui-icon-delete'>&nbsp;取消</i></button>"
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
							parent.location.href="needDeti.html";
						},
						error : function() {
							alert("请求失败！");
						}
					});
				}
			
		//竞标结束的-----------------------------------------------------------------
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
			url : "showLeagureBiding.action",
			type : "post",
			data : {
				"leaId":leaId,
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
							+"<div class='neetype'>竞标结束</div>"
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
	//竞标完成中标的---------------------------------------------------------------
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
			url : "showLeagureBiding.action",
			type : "post",
			data : {
				"leaId":leaId,
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
							+"<div class='neetype'>"
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
					area: ['500px', '400px'],
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
	//流标的--------------------------------------------
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
			url : "showLeagureBiding.action",
			type : "post",
			data : {
				"leaId":leaId,
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
							+"<div class='neetype'>流标</div>"
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
    
    //已完成的-----------------------------------------------------
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
			url : "showLeagureBiding.action",
			type : "post",
			data : {
				"leaId":leaId,
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
							+"<div class='neetype'>需求完成</div>"
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
    //竞标失败的
    
    function myBidedFailed(){
    	//从哪里开始
		start = 0;
		//每页的条数
		limit = 3;
		//当前页
		index = 1;
		//投标中的
    initmyBidedFailed();
    	
    }
    
    function initmyBidedFailed(){
    	$.ajax({
			url : "showLeagureBiding.action",
			type : "post",
			data : {
				"leaId":leaId,
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
							+"<div class='neetype'>竞标失败</div>"
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
								initmyBidedFailed();
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
		</script>

	</body>

</html>