<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>显示投标联盟的投标信息(开发中)</title>
		<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
		<style>
			.my-form {
				width: 520px;
				/*border-top: 2px solid #D8312A;*/
				margin-left: 20px;
				padding-top: 20px;
			}
			
			.div-logArea {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
				width: 600px;
				height: 600px;
				/*margin-left: 200px;*/
				margin-left: auto;
				margin-right: auto;
				margin-top: 50px;
				border-radius: 10px;
			}
			
			.my-content {
				border: 1px solid lightgray;
				width: 409px;
				height: 100px;
				overflow-y:scroll;
				padding-left: 9px;
			}
			.my-content::-webkit-scrollbar {display:none}
		    .my-textarea{
		    border: 1px solid lightgray;
				width: 409px;
				height: 100px;
				overflow-y:scroll;
				padding-left: 9px;
		    }
		    .my-textarea::-webkit-scrollbar {display:none}
		</style>
	</head>

	<body>
		<div class="div-logArea">
			<br>
			<h1 align="center">中标人信息表</h1>

			<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">

			<div class="layui-form my-form" id="main-box" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">投标联盟：</label>
					<div class="layui-input-block">
						<input id="in-user" lay-verify="required" class="layui-input" readonly="readonly" value="刘备">
					</div>

				</div>
                <div class="layui-form-item">
					<label class="layui-form-label">所属类型：</label>
					<div class="layui-input-block">
						<input id="in-type" lay-verify="required" class="layui-input" value="服务商联盟"  readonly="readonly">
					</div>
				</div>
                <div class="layui-form-item">
					<label class="layui-form-label">联盟介绍：</label>
					<div class="layui-input-block">
						<div id="in-myself" class="my-textarea"></div>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">投标方案：</label>
					<div class="layui-input-block">
						<div id="in-project" class="my-content" ></div>
					</div>
				</div>
                
                
				<div class="layui-form-item">
					<label class="layui-form-label">联系电话：</label>
					<div class="layui-input-block">
						<input id="in-phone" lay-verify="required" class="layui-input" readonly="readonly"> 
					</div>
				</div>
				
			</div>
		</div>
		<div><img id="my-img" src=""></div>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
		<script src="3rd/Content/ace/ace.js"></script>
		<script>
			layui.use(['layedit', 'layer', 'jquery'], function() {

			})
			
		
			//子类接收数据方法
			function inputDataHandle(data) {
				//投标联盟id
				var leaId=data[0];
				//投标服务商id
				var userId=data[1];
				//投标id
				var bidId = data[2];
				
				//显示这个投标联盟的投标信息
				$.ajax({
					url: "showThisBidderLeagueMeg.action",
					type: "post",
					data: {
						"bidId":bidId,
						"leaId":leaId,
						"userName":""
					},
					dataType: "json",
					success: function(msg) {
						//投标数据
						var tender = msg.tender;
						$("#in-user").val(tender.leaName);
						$("#in-myself").append(tender.leaMemo);
						$("#in-project").append(tender.project);
						$("#in-phone").val(tender.phone);
					},

					error: function() {
						layer.msg('请求失败！',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });
					}
				}); 
			}
	     
		</script>
	</body>

</html>