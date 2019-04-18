<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style type="text/css">
			.typeList {
				width: 100%;
				text-align: center;
				padding-top: 0px;
				padding-bottom: 20px
			}
			
			.type-content {
				width: 80%;
				margin: 0 auto;
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-ms-flex-wrap: wrap;
				flex-wrap: wrap;
				padding-top: 5px;
				padding-bottom: 30px
			}
			
			.type-content li {
				width: 15%;
				height: 217px;
				background: #fff;
				margin-left: 1%;
				margin-top: 10px;
				position: relative;
				cursor: pointer;
				border-radius: 5px
			}
			
			.type-content li:hover {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2)
			}
			
			.circle {
				width: 100px;
				height: 100px;
				border: 1px solid #63b5fb;
				margin: 20px auto;
				border-radius: 50%;
				text-align: center
			}
			
			.circle img {
				width: 50px;
				-webkit-transform: translateY(50%);
				transform: translateY(50%)
			}
			
			.type-content li h4 {
				font-size: 18px;
				font-weight: 700;
				text-align: center;
				color: #48576a
			}
			
			.type-content li p {
				font-size: 15px;
				font-weight: 400;
				text-align: center;
				margin-top: 10px;
				color: #48576a
			}
			
			.fast-publish {
				display: block;
				position: absolute;
				bottom: 0;
				left: 0;
				width: 100%;
				height: 40px;
				background: #42a7ff;
				color: #fff;
				font-size: 15px;
				font-weight: 400;
				text-align: center;
				line-height: 40px
			}
			
			.moreType {
				border-radius: 100px;
				width: 200px;
				height: 45px
			}
			
			@media print,
			screen and (min-width:40em) {
				.show-large-only {
					display: block!important
				}
			}
			
			@media print,
			screen and (max-width:64em) and (min-width:40em) {
				.type-content {
					width: 90%
				}
			}
			
			@media print,
			screen and (max-width:40em) {
				.show-large-only {
					display: none!important
				}
				.smallType {
					width: 90%;
					margin: 0 auto;
					clear: both
				}
				.smallType li {
					float: left;
					width: 33%
				}
				.smallType .circle {
					width: 50px;
					height: 50px
				}
				.smallType .circle img {
					width: 30px;
					height: 30px
				}
				.smallType h4 {
					font-size: 13px;
					font-weight: 700;
					text-align: center;
					color: #48576a
				}
				.smallType .circle img {
					-webkit-transform: translateY(30%);
					transform: translateY(30%)
				}
				.small-ul li:hover {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2)
			}
			}
			
			@media print,
			screen and (min-width:64.3em) {
				.content-min-width {
					min-width: 82.14rem
				}
			}
			
			@media only screen and (min-width:768px) {
				.hidden-sm-and-up {
					display: none!important
				}
			}
		
		</style>
			
		<style>
			.type-content li:hover .circle {
				border: 2px solid #63b5fb;
			}
			
			.type-content li:hover p {
				display: none !important
			}
			
			.type-content li:hover span {
				display: inline !important;
				color: white;
				font-size: 18px;
			}
			.type-content li:hover .div-text {
				margin-top: 10px;
				height: 40px;
				line-height: 40px;
				background-color: #63b5fb;
			}
			.div-button{
				margin-top: 50px;
				text-align: center;
			}
			.my-button{
				width: 200px;
				
				font-size: 20px;
			}
		</style>
	</head>

	<body>
		<br />
		<br />
		<h1 align="center">服务类型管理</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		
		<div class="typeList">
			<div class="show-large-only">
				<ul class="type-content content-min-width" id="ul-type">
					
				</ul>
				<div class="layui-col-md2 layui-col-md-offset5" id="button">
			
			</div>
			</div>
		
		
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script type="text/javascript">
		//获取服务类型
		function selectServerType(){
			$("#ul-type").empty();
			$.ajax({
				url : "selectServerType.action",
				type : "post",
				data : {},
				dataType : "json",
				success : function(msg) {
					//得到的服务类型信息
					var serverTypes= msg.serverTypes;
					//在ul标签中添加数据
					for (var i = 0; i < serverTypes.length; i++) {
						$("#ul-type").append("<li>"
						+"<div class='circle'><img src="+serverTypes[i].picUrl+"></div>"
						+"<h4>"+serverTypes[i].name+"</h4>"
						+"<div class='div-text'>"
						+"<span style='display: none;'>已 配 置</span>"
						+"</div>"
						+"</li>");
					}
					setTimeout(addBtn,300);
				},
				error : function() {
					alert("请求失败！");
				}
			});
			
		}
		//显示已配置的服务
		selectServerType();
	
		//
		layui.use('layer', function() {
			var layer = layui.layer; //执行一个laydate实例 
			window.openAdd = function() {
				layer.open({
					type: 2,
					title: false,
					area: ['500px', '300px'],
					content: 'addServerType.html', //iframe的url，no代表不显示滚动条
				/*	success: function(layero, index) {
						var data=new Array();
						data[0]=$("#title").val();//自己的数据存进去
						
						var body=layer.getChildFrame('body',index);//确定两个界面父子关系
						var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
						iframeWin.inputDataHandle(data);
					}*/

				});

			}
		});
		//添加按钮
		 function addBtn() {
			 //添加按钮
		
				$("#button").append("<div class='layui-anim layui-anim-scale'>"
						+"<button class='layui-btn layui-btn-fluid' "+
						" style='background-color:#F4A460' onclick='openAdd()'><i class='layui-icon layui-icon-add-1'>&nbsp;添加服务</i></button>"+"</div>");
		   }
		
		
		</script>
			
	</body>

</html>