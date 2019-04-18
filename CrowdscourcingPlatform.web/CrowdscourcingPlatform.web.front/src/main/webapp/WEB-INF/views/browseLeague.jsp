<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>浏览所有的联盟</title>
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
			margin-left: 437px;
			margin-top: -5px;
		}
		
		.del {
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 325px;
			margin-top: -5px;
		}
		
		.dwon {
			position: absolute;
			display: inline-block;
			width: 60px;
			margin-left: 395px;
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
		   margin-top: 200px;
		   margin-bottom: 50px;
		}
	</style>

	<body >

			<div class="project-list" id="needContent">

			</div>


		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			layui.use(['element','layer'], function() {
				var element = layui.element;
				initAllLeague();
			});
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 4;
			//当前页
			var index = 1;
            //生成联盟
            //浏览全部联盟
            
            function initAllLeague(){
                $.ajax({
					url : "initAllLeagues.action",
					type : "post",
					data : {
						"start":start,
						"limit":limit
					},
					dataType : "json",
					success : function(msg) {
						//拿到
						var leas = msg.leas;
						$("#needContent").empty();
						for(var i = 0;i<leas.length;i++){
							var lea = leas[i];
							var peo = msg.counts[i]+1;
							$("#needContent").append("<div class='out-workContent'>"
									+"<div class='workContent' >"
									+"<div class='el-col col-1'>"
									+"<img alt='' class='project-img' src='"
									+lea.src+"' ></a>"
									+"</div>"
			                        +"<div class='el-col col-2'>"
							        +"<div class='workTitle'>"
							        +lea.name
							        +"<span class='workMoney'>"
									+peo+"人"
									+"</span>"		
									+"</div>"
									+"<div class='workUser'>"
								    +"<i class='layui-icon layui-icon-user'></i>"
								    +"盟主：&nbsp;"+lea.userName
									+"<span style='margin-left: 20px;color:gray;'>"
									+"成立时间:"+lea.updateTime.substring(0,19)
									+"</span>"				
									+"</div>"
									+"<div class='workType'>"
								    +"<div class='type'>联盟</div>"
									+"<div class='neetype'>正常运营</div>"
									+"<div class='buy'>"
									+"<button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;'>"
									+"<i class='layui-icon layui-icon-align-center' "
									+"leaId="+lea.id
									+" onclick='addThisLea(this)'>&nbsp;申请加入</i></button>"	
									+"</div>"
									+"</div>"
							        +"</div>"
							        +"</div>"
						            +"</div>");
						}
						//返回回来的总条数
						var count = msg.count;
						if(count==0){
							$("#needContent").append("<img class='zero_img' src='img/empty.png'  >");
						}
						if(count!=0){
						$("#needContent").append("<div id='page' align='center'></div>");
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
										initAllLeague();
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
			
          //申请加入这个联盟
			function addThisLea(e){
					layer.confirm('确定申请加入该联盟！', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							layer.closeAll('dialog'); 
							
							addLeaUser(e); 
						}
					);
				}
          
          function addLeaUser(e){
        	  
        	  $.ajax({
	  				url : "applyJoinLeague.action",
	  				type : "post",
	  				data : {
	  					"leaId" : $(e).attr("leaId")
	  				},
	  				dataType : "json",
	  				success : function(msg) {
	  					if(msg.res=="isUser"){
	  						layer.msg('跳到成为服务商界面！', {
		  						icon : 2,
		  						time : 1000, //20s后自动关闭
		  					});
	  					}else if(msg.res=="isLeaMaster"){
	  						layer.msg('您已经加入了联盟或联盟正在审核中！', {
		  						icon : 2,
		  						time : 1000, //20s后自动关闭
		  					});
	  					}else if(msg.res=="isAdded"){
	  						layer.msg('您已经加入了无法加入！', {
		  						icon : 2,
		  						time : 1000, //20s后自动关闭
		  					});
	  					}else if(msg.res=="isApply"){
	  						layer.msg('这个联盟已经申请过了！请等待盟主审核！', {
		  						icon : 2,
		  						time : 1000, //20s后自动关闭
		  					});
	  					}else if(msg.res=="suc"){
	  						layer.msg('申请成功！请等待盟主审核！', {
		  						icon : 1,
		  						time : 1000, //20s后自动关闭
		  					});
	  					}else{
	  						layer.msg('申请失败！', {
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
		</script>

	</body>

</html>