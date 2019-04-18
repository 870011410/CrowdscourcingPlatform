<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
.my-form {
	width: 400px;
	/*border-top: 2px solid #D8312A;*/
	margin: auto;
	top: 80px;
	bottom: 0;
}
</style>
</head>

<body>
	<br />
	<h1 align="center">请确认支付</h1>
	<br />
	
	
	<div class="layui-form my-form" >
		<i class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 80px;margin-left: 160px;"></i>

		<div class="layui-form-item">
			<div class="layui-input-block" style="margin-left:40px;margin-top: 20px;">
				<button class="layui-btn layui-btn-normal" lay-submit style="width:160px;font-size:16px;" onclick="closeNow()"><i class="layui-icon layui-icon-ok">支付已完成</i></button>
				<button class="layui-btn layui-btn-primary" style="width:160px;font-size:16px;" onclick="closeNow()"><i class="layui-icon layui-icon-close">支付遇到问题</i></button>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;
		});

		var index = parent.layer.getFrameIndex(window.name);
	
		function closeNow(){
		   /*  parent.$("#if-right").contents().showInfo();  */
			parent.layer.close(index);
		    parent.refresh(); 
		}

	</script>
<body>
<html>